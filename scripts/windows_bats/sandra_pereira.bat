#Deleta as conexões anteriores
net use * /d /y

#Mapeamentos
net use P: \\srvfs01\publico /user:sandra.pereira %GG%9q?Q /persistent:yes
net use T: \\srvfs01\temporario /user:sandra.pereira %GG%9q?Q /persistent:yes
net use R: \\srvfs01\rh /user:sandra.pereira %GG%9q?Q /persistent:yes
net use Z: \\srvfs01\comercial /user:sandra.pereira %GG%9q?Q /persistent:yes
net use Y: \\srvfs01\administrativo /user:sandra.pereira %GG%9q?Q /persistent:yes
net use L: \\srvfs01\locacao /user:sandra.pereira %GG%9q?Q /persistent:yes
net use W: \\srvfs01\carteira /user:sandra.pereira %GG%9q?Q /persistent:yes
