class HttpErrorHandle {
  String statusCodeError(int statusCode) {
    String errorDescription = "";
    switch (statusCode) {
      case 400:
        errorDescription = "Bad Request";
        break;
      case 401:
        errorDescription = "Unauthorised Request";
        break;
      case 403:
        errorDescription = "Forbidden";
        break;
      case 404:
        errorDescription = "Not Found";
        break;
      case 409:
        errorDescription = "Conflict";
        break;
      case 408:
        errorDescription = "Request TimeOut";
        break;
      case 500:
        errorDescription = "Internal Service Error";
        break;
      case 503:
        errorDescription = "Service Unavaible";
        break;
      default:
        errorDescription = "Received invalid status code: $statusCode";
    }
    return errorDescription;
  }
}
