resource "kubernetes_config_map_v1" "nginx-config" {
  metadata {
    name = "arsenal-config"
    namespace = "arsenal"
  }

  data = {
    "index.html" = <<-EOT
        |
    <html>
    <body style="background-color:Red;">
    <h1 style="color:Gold;">Welcome to Arsenal Football Club!</h1>
    <h2 style="color:Gold;">The Only Premier League Team To Ever Go An Enitire Season Invincible #49Undefeated/</h2>
    </html>
      EOT
  }
}



/*<html>
    <h1 style="background-color:DodgerBlue; "color:Tomato;">Welcome to Arsenal Declan Rice</h1>
    <p style="background-color:DarkGoldenRod; "color:MintCream;">The Only Premier League Club to Go Invincible</p>
    <h3 style="background-color:Gold; "color:Navy;">With You, We Can Go The Distance</h3>
    </html>*/
