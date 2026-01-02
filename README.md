# Afectod - Movie Discovery App

## İçindekiler

* Genel Bakis
* Mimari Yaklasim
* Clean Architecture Katmanlari
* Klasor Yapisi
* Mimari Prensipler
* Kurulum ve Çalıştırma

---

## Genel Bakis

Afectod, Flutter ekosistemi kullanılarak Clean Architecture ve Feature-First yaklaşımları benimsenerek geliştirilmiş, ölçeklenebilir ve uzun vadeli sürdürülebilirliği hedefleyen bir film keşif uygulamasıdır.

Proje adı; Defacto kelimesinin bilinçli bir anagramıdır. Bu tercih; bilinen bir kökenden türeyen, ancak kendine özgü bir kimlik inşa eden yapıyı sembolize eder. Mimari yaklaşımda da benzer bir prensibe sahiptir; yaygın kabul görmüş kullanımlar proje ihtiyaçlarına göre rafine edilmeye çalışılmıştır.

---

## Mimari Yaklasim

Afectod içerisinde katmanlar net biçimde tanımlanmıştır ancak erken aşamada aşırı soyutlamadan kaçınılarak geliştirme verimliliği korunmuştur.

Mimari kararlar alınırken; uygulamanın mevcut kapsamı ve modül sayısı ve genişleme senaryoları esas alınmıştır.

---

## Clean Architecture Katmanlari

Proje üç ana katmandan oluşur:

### Presentation Layer

- UI bileşenleri
- State yönetimi (Cubit)
- Kullanıcı etkileşimleri

### Domain Layer

- İş kuralları
- Use case'ler
- Uygulamanın saf iş mantığı

### Data Layer

- API ve local veri kaynakları
- Model dönüşümleri
- Service ve repository yapıları

---

## Klasor Yapisi

```
lib/
├── app/
│   ├── common/                  # Uygulama genelinde paylaşılan altyapı
│   │   ├── client/              # HTTP client, interceptors, network konfigürasyonu
│   │   ├── constants/           # Sabitler (renkler, endpoint'ler, spacing vb.)
│   │   ├── enums/               # Enum tanımları
│   │   ├── extensions/          # Dart extension'ları
│   │   ├── function/            # Saf yardımcı fonksiyonlar
│   │   ├── generated/           # Code generation çıktıları (l10n)
│   │   ├── get_it/              # Dependency Injection konfigürasyonu
│   │   ├── hive/                # Hive adapter ve box tanımları
│   │   ├── l10n/                # Localization dosyalar (ARB)
│   │   ├── locale/              # Dil yönetimi ve locale state
│   │   ├── router/              # AutoRoute yapılandırması
│   │   ├── theme/               # Tema, renk paleti ve typography
│   │   ├── utils/               # Genel amaçlı yardımcı sınıflar
│   │   └── widgets/             # Feature bağımsız, yeniden kullanılabilir UI bileşenleri
│   │       ├── appbar/
│   │       ├── bottom_sheet/
│   │       ├── button/
│   │       ├── gap/
│   │       ├── scaffold/
│   │       ├── state/           # Loading, error, empty state bilesenleri
│   │       └── textfield/
│   │
│   └── features/                # Feature bazlı modüler yapı
│       ├── data/                # Veri katmanı
│       │   ├── models/          # API ve local storage modelleri
│       │   └── services/        # Remote / local servis implementasyonları
│       │
│       └── presentation/        # UI ve state katmanı
│           ├── auth/
│           ├── discover/
│           ├── favorites/
│           ├── detail/
│           ├── main/
│           ├── search/
│           ├── settings/
│           └── splash/
│
├── core/                        # App'ten bağımsız, düşük seviye yardımcı modüller
│   └── helpers/
│       ├── border/
│       ├── padding/
│       ├── screen_util/
│       ├── shared_preferences/
│       └── webview/
│
└── main.dart                    # Uygulama giriş noktası
```

---

## Mimari Prensipler

- Feature Isolation: Her feature kendi UI ve state sınırları içerisinde geliştirilir.
- Katmanlı Sorumluluk: Presentation, Domain ve Data katmanları birbirinden ayrıdır.
- Bağımlılıkların Kontrolü: Bağımlılıklar merkezi olarak yönetilir.
- Okunabilirlik Önceliği: Mimari karmaşıklık, kod okunabilirliğinin önüne geçmez.

---

## Best Practices

- Reusable widget'lar common altında tutulur
- Hard-coded değerlerden kaçınılır
- Tüm string'ler localization üzerinden yönetilir
- Error ve bottom sheet yönetimi merkezi helper'lar ile sağlanır
- Büyük widget'lar küçük parçalara bölünür

---

## Kurulum ve Çalıştırma

### Gereksinimler

- Flutter SDK (3.10.4 veya üzeri)
- Dart SDK (3.10.4 veya üzeri)

### Kurulum Adımları

1. **Bağımlılıkları yükleyin:**
   ```bash
   flutter pub get
   ```

2. **Code generation çalıştırın:**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

   veya script dosyasını kullanarak:
   ```bash
   ./script/build_runner.sh
   ```

3. **Otomatik kurulum script'i ile tüm adımları gerçekleştirin:**
   ```bash
   ./script/setup.sh
   ```

### Uygulamayı Çalıştırma

- **Debug modda çalıştırın:**
  ```bash
  flutter run
  ```

### Proje Yapısı

```
├── screenshots/           # Uygulama ekran görüntüleri
└── script/
    ├── build_runner.sh   # Code generation script'i
    └── setup.sh         # Otomatik kurulum script'i
```

---

Son Guncelleme: 2026-01-02

Proje: Afectod - Movie Discovery App

Mimari: Clean Architecture + Feature First
