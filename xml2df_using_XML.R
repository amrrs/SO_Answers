library(XML)

raw_result <- '<votos>
<Deputado Nome="Roberto Britto" ideCadastro="141529" Partido="PP " UF="BA" Voto="Sim "/>
<Deputado Nome="Luiz Argôlo" ideCadastro="160547" Partido="PP " UF="BA" Voto="Sim "/>
<Deputado Nome="José Carlos Araújo" ideCadastro="74140" Partido="PSD " UF="BA" Voto="Sim "/>
</votos>'

#i faced encoding issue hence

raw_result <- iconv(raw_result,'latin1','utf-8')

data.frame(do.call(rbind,xmlToList(raw_result)))
