# 📱 Sentiric Mobile

[![Status](https://img.shields.io/badge/status-prototype-orange.svg)]()
[![Framework](https://img.shields.io/badge/framework-Flutter-blue.svg)]()

**Sentiric Mobile**, Sentiric platformunun mobil kokpitidir. Ajanlar, süpervizörler ve gelecekte müşteriler için tasarlanmış, platformun tüm gücünü mobil cihazlara taşıyan bir uygulamadır.

## 🎯 Temel Sorumluluklar

*   **Agent Arayüzü:** İnsan agent'ların hareket halindeyken çağrıları yönetmesini, müşteri bilgilerini görmesini ve AI ile etkileşim kurmasını sağlar.
*   **Süpervizör Dashboard'u:** Yöneticilerin takım performansını, aktif çağrıları ve önemli metrikleri anlık olarak mobil cihazlarından izlemesini sağlar.
*   **Müşteri Portalı (Gelecek):** Müşterilerin kendi çağrı geçmişlerini, faturalarını ve ayarlarını yönetebileceği bir arayüz sunar.
*   **VoIP İstemcisi:** `sentiric-sip-client-sdk`'yı kullanarak, uygulama üzerinden doğrudan telefon görüşmesi yapma ve alma yeteneği sunar.

## 🛠️ Teknoloji Yığını

*   **Framework:** Flutter
*   **Dil:** Dart
*   **State Management:** Riverpod
*   **Routing:** GoRouter
*   **API İletişimi:** HTTP

## 🔌 API Etkileşimleri

*   **Giden (İstemci):**
    *   `sentiric-api-gateway-service` (REST/JSON): Tüm veri ve yönetim isteklerini bu merkezi kapıya yapar.
    *   `sentiric-sip-gateway-service` (SIP/WebRTC): Sesli iletişim için.

## 🚀 Yerel Geliştirme

1.  Flutter SDK'sının kurulu olduğundan emin olun.
2.  Bağımlılıkları yükleyin: `flutter pub get`
3.  Uygulamayı bir emülatörde veya fiziksel cihazda çalıştırın: `flutter run`

## 🤝 Katkıda Bulunma

Katkılarınızı bekliyoruz! Lütfen projenin ana [Sentiric Governance](https://github.com/sentiric/sentiric-governance) reposundaki kodlama standartlarına ve katkıda bulunma rehberine göz atın.

---
## 🏛️ Anayasal Konum

Bu servis, [Sentiric Anayasası'nın (v11.0)](https://github.com/sentiric/sentiric-governance/blob/main/docs/blueprint/Architecture-Overview.md) **Zeka & Orkestrasyon Katmanı**'nda yer alan merkezi bir bileşendir.