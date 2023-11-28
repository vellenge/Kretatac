enum NetworkData {
  ideas(
      "https://docs.google.com/spreadsheets/d/e/2PACX-1vR6nBQQx88Y7W2GPw4ZLbERZAWqBCJqrKqQJJ1RMevXL9X4Q_PU-C76gUFDWqgq4ubrHMeDkgEtg7Bh/pub?gid=0&single=true&output=csv"),
  therapies(
      "https://docs.google.com/spreadsheets/d/e/2PACX-1vR6nBQQx88Y7W2GPw4ZLbERZAWqBCJqrKqQJJ1RMevXL9X4Q_PU-C76gUFDWqgq4ubrHMeDkgEtg7Bh/pub?gid=558647994&single=true&output=csv");

  const NetworkData(this.url);

  final String url;
}
