enum Env { development, stagging, production }
enum ProductApps { financial, legal }

class AppConfig {
  static String encryptionKey = "shbZWroB2tkku5Km";
  static Env env = Env.development;
  static ProductApps product = ProductApps.financial;
  static String google_map_key = "";
}
