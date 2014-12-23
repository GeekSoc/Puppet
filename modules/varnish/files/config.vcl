###################################
# This file is managed by Puppet. #
###################################
# 
# This is a basic VCL configuration file for varnish.  See the vcl(7)
# man page for details on VCL syntax and semantics.
# 
# 

# Backend Servers
backend default {
    .host = "130.159.141.81";
    .port = "80";
    .connect_timeout = 600s;
    .first_byte_timeout = 600s;
    .between_bytes_timeout = 600s;
}

backend gitlab {
    .host = "130.159.141.94";
    .port = "80";
    .connect_timeout = 600s;
    .first_byte_timeout = 600s;
    .between_bytes_timeout = 600s;
}

backend tauron {
    .host = "130.159.141.117";
    .port = "80";
    .connect_timeout = 600s;
    .first_byte_timeout = 600s;
    .between_bytes_timeout = 600s;
}

backend mirror {
    .host = "130.159.141.98";
    .port = "80";
    .connect_timeout = 600s;
    .first_byte_timeout = 600s;
    .between_bytes_timeout = 600s;
}

backend tweevo {
    .host = "130.159.141.102";
    .port = "80";
    .connect_timeout = 600s;
    .first_byte_timeout = 600s;
    .between_bytes_timeout = 600s;
}

backend hive {
    .host = "130.159.141.66";
    .port = "80";
    .connect_timeout = 600s;
    .first_byte_timeout = 600s;
    .between_bytes_timeout = 600s;
}

# Routing
sub vcl_recv {
  if (req.http.host == "gitlab.geeksoc.org") {
    set req.backend = gitlab;
  }
  
  if (req.http.host == "nagios.geeksoc.org") {
    set req.backend = tauron;
  }

  if (req.http.host == "etckeeper.geeksoc.org") {
    set req.backend = tauron;
  }

  if (req.http.host == "munin.geeksoc.org") {
    set req.backend = tauron;
  }

  if (req.http.host == "mirror.geeksoc.org") {
    set req.backend = mirror;
  }

  if (req.http.host == "tweevo.geeksoc.org") {
    set req.backend = tweevo;
  }

  if (req.http.host == "webchat.geeksoc.org") {
    set req.backend = hive;
  }

  return(pipe);
}

sub vcl_pipe {
     if (req.http.upgrade) {
         set bereq.http.upgrade = req.http.upgrade;
     }
}

#sub vcl_recv {
#if (req.http.Cookie) {
#    set req.http.Cookie = ";" req.http.Cookie;
#    set req.http.Cookie = regsuball(req.http.Cookie, "; +", ";");
#    set req.http.Cookie = regsuball(req.http.Cookie, ";(COOKIE1|COOKIE2)=", "; \1=");
#    set req.http.Cookie = regsuball(req.http.Cookie, ";[^ ][^;]*", "");
#    set req.http.Cookie = regsuball(req.http.Cookie, "^[; ]+|[; ]+$", "");
#
#    if (req.http.Cookie == "") {
#        remove req.http.Cookie;
#    }
#}
#}

# 
# Below is a commented-out copy of the default VCL logic.  If you
# redefine any of these subroutines, the built-in logic will be
# appended to your code.
# 
# sub vcl_recv {
#     if (req.http.x-forwarded-for) {
# 	set req.http.X-Forwarded-For =
# 	    req.http.X-Forwarded-For ", " client.ip;
#     } else {
# 	set req.http.X-Forwarded-For = client.ip;
#     }
#     if (req.request != "GET" &&
#       req.request != "HEAD" &&
#       req.request != "PUT" &&
#       req.request != "POST" &&
#       req.request != "TRACE" &&
#       req.request != "OPTIONS" &&
#       req.request != "DELETE") {
#         /* Non-RFC2616 or CONNECT which is weird. */
#         return (pipe);
#     }
#     if (req.request != "GET" && req.request != "HEAD") {
#         /* We only deal with GET and HEAD by default */
#         return (pass);
#     }
#     if (req.http.Authorization || req.http.Cookie) {
#         /* Not cacheable by default */
#         return (pass);
#     }
#     return (lookup);
# }
# 
# sub vcl_pipe {
#     # Note that only the first request to the backend will have
#     # X-Forwarded-For set.  If you use X-Forwarded-For and want to
#     # have it set for all requests, make sure to have:
#     # set req.http.connection = "close";
#     # here.  It is not set by default as it might break some broken web
#     # applications, like IIS with NTLM authentication.
#     return (pipe);
# }
# 
# sub vcl_pass {
#     return (pass);
# }
# 
# sub vcl_hash {
#     set req.hash += req.url;
#     if (req.http.host) {
#         set req.hash += req.http.host;
#     } else {
#         set req.hash += server.ip;
#     }
#     return (hash);
# }
# 
# sub vcl_hit {
#     if (!obj.cacheable) {
#         return (pass);
#     }
#     return (deliver);
# }
# 
# sub vcl_miss {
#     return (fetch);
# }
# 
# sub vcl_fetch {
#     if (!beresp.cacheable) {
#         return (pass);
#     }
#     if (beresp.http.Set-Cookie) {
#         return (pass);
#     }
#     return (deliver);
# }
# 
# sub vcl_deliver {
#     return (deliver);
# }
# 
# sub vcl_error {
#     set obj.http.Content-Type = "text/html; charset=utf-8";
#     synthetic {"
# <?xml version="1.0" encoding="utf-8"?>
# <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
#  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
# <html>
#   <head>
#     <title>"} obj.status " " obj.response {"</title>
#   </head>
#   <body>
#     <h1>Error "} obj.status " " obj.response {"</h1>
#     <p>"} obj.response {"</p>
#     <h3>Guru Meditation:</h3>
#     <p>XID: "} req.xid {"</p>
#     <hr>
#     <p>Varnish cache server</p>
#   </body>
# </html>
# "};
#     return (deliver);
# }
