- 👋 Hi, I’m @amruthanamapure


PROGRAMS.....

program 1 LED 

#define ledpin 9
void setup()
{
  pinMode(9,OUTPUT);
}
void loop()
{
  digitalWrite(9,HIGH);
  delay(5000);
  digitalWrite(9,LOW);
  delay(2000);
}

prog : 02 OLED

#include <DHT.h>
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#define DHTPIN 3
#define DHTTYPE DHT11
#define SCREEN_WIDTH 128
#define SCREEN_HIGHT 32
#define OLED_RESET    -1
#define SCREEN_ADDRESS 0x3c
float temperature=0, humidity=0;
DHT dht(DHTPIN, DHTTYPE);
Adafruit_SSD1306 display(SCREEN_WIDTH,SCREEN_HIGHT, &Wire, OLED_RESET);
void setup()
{
   dht.begin();
  Serial.begin(9600);
  if(!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS))
  {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); 
  }
  display.display();
  delay(2000);
  display.clearDisplay();
  display.setTextColor(SSD1306_WHITE);
  
}
void loop()
{
  humidity =dht.readHumidity();
  temperature =dht.readTemperature();
  display.clearDisplay();
  display.setTextSize(1);
  display.setCursor(0, 0);
  display.print("dht11 Sensor");
  display.setCursor(0, 10);
  display.print(" % R H =");
  display.print(humidity);
  display.setCursor(0, 20);
  display.print("Temp(Deg C) = ");
  display.print(temperature);
  display.display();
  Serial.print("Relative Humidity % :");Serial.println(humidity);
  Serial.print("Temperature in degree celcius:");Serial.println(temperature);
  delay(5000);
  delay(3000);
  display.clearDisplay();
  delay(2000);
}

PROGRAM 3 -DHT11

#include <Wire.h>
#include <DHT.h>
#include <LiquidCrystal.h>
#define DHTPIN 2
#define DHTTYPE DHT11
DHT dht11(DHTPIN,DHTTYPE);
LiquidCrystal lcd(12,11,10,9,8,7);
void setup()
{
  dht11.begin();
  lcd.begin(16,2);
  lcd.clear();
  Serial.begin(9600);
}
void loop()
{
float humidity = dht11.readHumidity();
float temperature =dht11.readTemperature();
lcd.setCursor(0,0);
lcd.print("RH:");
lcd.print(humidity);
lcd.print("%");
float tempC1=dht11.readTemperature();
lcd.setCursor(0,1);
lcd.print("Temp:");
lcd.print(temperature);
lcd.print((char)223);
Serial.print("Realtive Humidity%:");Serial.println(humidity);
Serial.print("Temperature in degree celcius:");Serial.println(temperature);
delay(400);
}

PROGRAM 4(A) DC MOTOR

#define BUTTON_PIN 7
#define MT_RELAY_PIN 3
void setup()
{
  Serial.begin(9600);
  pinMode(BUTTON_PIN, INPUT);
  pinMode(MT_RELAY_PIN,OUTPUT);
}
void loop()
{
  int buttonState = digitalRead(BUTTON_PIN);
  if (buttonState == HIGH)
  {
    Serial.println("The button is being pressed, the motar is ON");
    digitalWrite(MT_RELAY_PIN,HIGH);
  }
  else
  if (buttonState == LOW)
  {
    Serial.println("The button is released,The motor is OFF");
    digitalWrite(MT_RELAY_PIN, LOW);
  }
  delay(200);
}
