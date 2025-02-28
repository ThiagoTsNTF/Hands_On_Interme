#include <WiFi.h>
#include <MPU6050.h>
#include <DHT.h>
#include <Wire.h>
#include <FirebaseESP32.h>
#include <NTPClient.h>
#include <WiFiUdp.h>

#define API_KEY "ZgVqvO02nNu97EMdxvZt14uySBe4csxpjGy0ev30"
#define DATABASE_URL "https://sleepguard-82799-default-rtdb.firebaseio.com"

FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP, "pool.ntp.org", -3 * 3600, 60000);

MPU6050 mpu;

#define SDA_PIN 22
#define SCL_PIN 23
#define BUZZER_PIN 25
#define PIR_PIN 32
#define GREEN_PIN 18
#define RED_PIN 19
#define DHT_PIN 4
#define DHT_TYPE DHT11

DHT dht(DHT_PIN, DHT_TYPE);

const char* ssid = "CIT_Alunos";
const char* password = "alunos@2024";

unsigned long lastMotionTime = 0;
unsigned long motionDelay = 3000;
bool motionDetected = false;

unsigned long ultimoEnvio = 0;
const unsigned long intervaloEnvio = 60000;

int limite_x = 17500;
int limite_y = 500;
int limite_z = 2700;
int temp_min = 18;
int temp_max = 30;
int umidade_min = 30;
int umidade_max = 70;

void buscarConfiguracoesFirebase() {
    if (Firebase.RTDB.getInt(&fbdo, "/config/limite_x")) limite_x = fbdo.intData();
    if (Firebase.RTDB.getInt(&fbdo, "/config/limite_y")) limite_y = fbdo.intData();
    if (Firebase.RTDB.getInt(&fbdo, "/config/limite_z")) limite_z = fbdo.intData();
    if (Firebase.RTDB.getInt(&fbdo, "/config/temp_min")) temp_min = fbdo.intData();
    if (Firebase.RTDB.getInt(&fbdo, "/config/temp_max")) temp_max = fbdo.intData();
    if (Firebase.RTDB.getInt(&fbdo, "/config/umidade_min")) umidade_min = fbdo.intData();
    if (Firebase.RTDB.getInt(&fbdo, "/config/umidade_max")) umidade_max = fbdo.intData();
}

void enviarAlerta(String mensagem) {
    timeClient.update();
    String horario = timeClient.getFormattedTime();
    String alertaID = String(millis());
    String caminho = "/alertas/" + alertaID;
    FirebaseJson json;
    json.set("mensagem", mensagem);
    json.set("horario", horario);
    Firebase.RTDB.setJSON(&fbdo, caminho.c_str(), &json);
}

void enviarVariaveisAmbiente() {
    timeClient.update();
    String horario = timeClient.getFormattedTime();
    int16_t ax, ay, az;
    mpu.getAcceleration(&ax, &ay, &az);
    float temperatura = dht.readTemperature();
    float umidade = dht.readHumidity();
    bool movimento = digitalRead(PIR_PIN);
    
    String caminho = "/variaveisAmbiente/" + String(millis());
    FirebaseJson json;
    json.set("horario", horario);
    json.set("posicao/x", ax);
    json.set("posicao/y", ay);
    json.set("posicao/z", az);
    json.set("temperatura", temperatura);
    json.set("umidade", umidade);
    json.set("movimento", movimento);
    Firebase.RTDB.setJSON(&fbdo, caminho.c_str(), &json);
}

void setup() {
    Serial.begin(115200);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) {
        delay(1000);
        Serial.print(".");
    }
    Serial.println("\nWiFi conectado!");
    
    Wire.begin(SDA_PIN, SCL_PIN);
    mpu.initialize();
    dht.begin();
    pinMode(BUZZER_PIN, OUTPUT);
    pinMode(RED_PIN, OUTPUT);
    pinMode(GREEN_PIN, OUTPUT);
    pinMode(PIR_PIN, INPUT);
    
    config.api_key = API_KEY;
    config.database_url = DATABASE_URL;
    Firebase.begin(&config, &auth);
    Firebase.reconnectWiFi(true);
    
    timeClient.begin();
    buscarConfiguracoesFirebase();
}

void loop() {
    int pirState = digitalRead(PIR_PIN);
    if (pirState == HIGH) {
        motionDetected = true;
        lastMotionTime = millis();
        digitalWrite(GREEN_PIN, HIGH);
        digitalWrite(RED_PIN, LOW);
        tone(BUZZER_PIN, 1000, 200);
        enviarAlerta("Movimento detectado!");
    }
    if (millis() - lastMotionTime > 10000) {
        motionDetected = false;
        digitalWrite(GREEN_PIN, LOW);
        digitalWrite(RED_PIN, HIGH);
        tone(BUZZER_PIN, 500, 500);
    }
    
    int16_t ax, ay, az;
    mpu.getAcceleration(&ax, &ay, &az);
    if (abs(ax) > limite_x || abs(ay) > limite_y || abs(az) > limite_z) {
        digitalWrite(GREEN_PIN, LOW);
        digitalWrite(RED_PIN, HIGH);
        tone(BUZZER_PIN, 2000, 500);
        enviarAlerta("Movimento excessivo detectado!");
    }
    
    float temperatura = dht.readTemperature();
    float umidade = dht.readHumidity();
    if (!isnan(temperatura) && (temperatura < temp_min || temperatura > temp_max)) {
        enviarAlerta("Temperatura fora da faixa aceitável!");
    }
    if (!isnan(umidade) && (umidade < umidade_min || umidade > umidade_max)) {
        enviarAlerta("Umidade fora da faixa aceitável!");
    }
    
    if (millis() - ultimoEnvio > intervaloEnvio) {
        enviarVariaveisAmbiente();
        ultimoEnvio = millis();
    }
    delay(500);
}