#Deleta as conexões anteriores
net use * /d /y

#Mapeamentos
net use P: \\srvfs01\publico /user:eduardo.cunha -w~Wu9h{ /persistent:yes
net use T: \\srvfs01\temporario /user:eduardo.cunha -w~Wu9h{ /persistent:yes
net use R: \\srvfs01\rh /user:eduardo.cunha -w~Wu9h{ /persistent:yes
net use Z: \\srvfs01\comercial /user:eduardo.cunha -w~Wu9h{ /persistent:yes
net use Y: \\srvfs01\administrativo /user:eduardo.cunha -w~Wu9h{ /persistent:yes
net use L: \\srvfs01\locacao /user:eduardo.cunha -w~Wu9h{ /persistent:yes
net use W: \\srvfs01\carteira /user:eduardo.cunha -w~Wu9h{ /persistent:yes
