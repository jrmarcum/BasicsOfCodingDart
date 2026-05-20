// URLs provide a uniform way to locate resources.
// Here's how to parse URLs in Dart using the built-in `Uri` class.

void main() {
  // We'll parse this example URL, which includes a
  // scheme, authentication info, host, port, path,
  // query params, and query fragment.
  final s = 'postgres://user:pass@host.com:5432/path?k=v#f';

  // Parse the URL.
  final u = Uri.parse(s);

  // Accessing the scheme is straightforward.
  print(u.scheme);

  // userInfo contains the raw "user:pass" authentication string.
  print(u.userInfo);

  // Split userInfo to get username and password.
  final userParts = u.userInfo.split(':');
  print(userParts[0]);
  print(userParts[1]);

  // host contains the hostname with port.
  print(u.host + (u.hasPort ? ':${u.port}' : ''));

  // host alone (without port).
  print(u.host);

  // port as a string.
  print(u.port);

  // path and fragment.
  print(u.path);
  print(u.fragment);

  // Raw query string.
  print(u.query);

  // Parse query params into a map.
  final m = Uri.splitQueryString(u.query);
  print(m);

  // Access a specific query parameter.
  print(m['k']);
}
