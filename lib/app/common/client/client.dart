import 'package:afectod/app/common/client/network/builder/network_manager.dart';

final class AfectodNetworkClient {
  static NetworkManager client() {
    return NetworkManager(
      authToken:
          "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZjJjY2JmMWE1OWVkYjQ0MmFiNzgxNDIwN2I3ZGUwZCIsIm5iZiI6MTc2NzAxMzgzNC42MzYsInN1YiI6IjY5NTI3ZGNhYjExMmZkNTU2ZGU0MTZhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.yt5F6FVUbYUSpw2G4dcjN_kysjhdLmhJViet_kFA8PI",
      baseURL: "https://api.themoviedb.org",
    );
  }
}
