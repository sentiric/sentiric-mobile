# 📱 Sentiric Mobile - Görev Listesi

Bu belge, `sentiric-mobile` uygulamasının geliştirme yol haritasını ve önceliklerini tanımlar.

---

### Faz 1: Temel Arayüz ve Navigasyon (Sıradaki Öncelik)

Bu faz, uygulamanın temel iskeletini ve ana ekranlarını oluşturmayı hedefler.

-   [ ] **Görev ID: MOB-001 - Proje Kurulumu**
    -   **Açıklama:** Flutter projesini oluştur, Riverpod (state management) ve GoRouter (routing) entegrasyonlarını yap.
    -   **Durum:** ⬜ Planlandı.

-   [ ] **Görev ID: MOB-002 - Giriş (Login) Ekranı**
    -   **Açıklama:** Kullanıcıların `api-gateway` üzerinden kimlik doğrulaması yapabileceği bir giriş ekranı tasarla.
    -   **Durum:** ⬜ Planlandı.

-   [ ] **Görev ID: MOB-003 - Agent Workspace İskeleti**
    -   **Açıklama:** Agent'ların çağrı kuyruğunu, aktif çağrıyı ve müşteri bilgilerini görebileceği temel bir arayüz iskeleti oluştur.
    -   **Durum:** ⬜ Planlandı.

---

### Faz 2: API Entegrasyonu ve Canlı Veri

Bu faz, arayüzü `api-gateway`'e bağlayarak canlı veri ile çalışır hale getirmeyi hedefler.

-   [ ] **Görev ID: MOB-004 - Çağrı Kuyruğu Entegrasyonu**
    -   **Açıklama:** WebSocket veya periyodik polling ile çağrı kuyruğunu API'den çekip canlı olarak göster.
    -   **Durum:** ⬜ Planlandı.

-   [ ] **Görev ID: MOB-005 - Müşteri Bilgisi Entegrasyonu**
    -   **Açıklama:** Aktif bir çağrı seçildiğinde, arayanın bilgilerini `user-service`'ten (API Gateway aracılığıyla) çekip göster.
    -   **Durum:** ⬜ Planlandı.

---

### Faz 3: Sesli İletişim (VoIP)

Bu faz, uygulamaya gerçek telefon görüşmesi yeteneklerini eklemeyi hedefler.

-   [ ] **Görev ID: MOB-006 - SIP Client SDK Entegrasyonu**
    -   **Açıklama:** `sentiric-sip-client-sdk`'nın Flutter versiyonunu (veya uygun bir alternatifi) entegre ederek platforma SIP üzerinden register olma yeteneği ekle.
    -   **Durum:** ⬜ Planlandı.

-   [ ] **Görev ID: MOB-007 - Çağrı Yönetimi**
    -   **Açıklama:** Uygulama içinden çağrı yanıtlama, sonlandırma, sessize alma ve aktarma gibi temel softphone özelliklerini implemente et.
    -   **Durum:** ⬜ Planlandı.