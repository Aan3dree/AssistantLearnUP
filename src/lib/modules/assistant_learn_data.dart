import '../models/learn_assistent.dart';

class AssistentLearnData {
  int _pageNumber = 0;
  final List<LearnAssistent> _learnData = [
    LearnAssistent('Assistente virtual inteligente',
        'Um assistente pessoal inteligente é um agente de software que pode realizar tarefas ou serviços para um indivíduo. Estas tarefas ou serviços são baseados na entrada do usuário, geolocalização, e a capacidade de acessar informações de uma variedade de fontes on-line, tais como condições meteorológicas e de trânsito, notícias, os preços das ações, horários de usuários, entre outros'),
    LearnAssistent('Assistente virtual inteligente',
        'Se trata de um sistema que acessa um banco de dados e, com grande velocidade, gera uma resposta. O que facilita e agiliza na obtenção de informações para usuários do Assistente Virtual. Além disso, os Assistentes Virtuais são capazes, por meio de Inteligência Artificial, de optimizar o banco de dados ao reconhecer mais perguntas e respostas com o passar do tempo. Portanto, desde o inicio do avanço exponencial de diversas áreas da ciência da computação e por meio de sua combinação, nas ultimas décadas. Os Assistentes Virtuais vem ganhando grande espaço.'),
    LearnAssistent('História',
        'O primeiro aparelho tecnológico com capacidade de reconhecimento de voz foi um brinquedo chamado Radio Rex, lançado na década de 1920, Rex era um cão de brinquedo que se movia (por meio de uma mola) quando a mola era liberada pela energia acústica de 500 Hz. Como 500 Hertz é aproximadamente a primeira vogal [eh] em "Rex", o cão se movia quando era chamado.'),
    LearnAssistent('Surgimento',
        'Os Assistentes Virtuais surgiram a partir do resultado da evolução e combinação de diversas áreas da ciência da computação, dentre elas, destacam-se: Inteligência Artificial: Permite que o recurso exiba características similares à inteligência humana, permitindo o aprendizado e a optimização do serviço prestado por ele; Processamento de Linguagem Natural: Permite que os usuários possam usar a linguagem natural, humana, para se comunicarem com os assistentes; Banco de Dados: Permite que a máquina armazene e recupere grandes volumes de informações; Redes de comunicação de dados: Permite que os Assistentes Virtuais estejam nas páginas a serem acessadas, com computadores pessoais, tablets e smarthphones.'),
    LearnAssistent('Aplicações',
        'Os Assistentes Virtuais Podem ser submetidos às mais variadas aplicações. Dentre elas estão aqui estão algumas: Saúde e bem estar, Turismo, Educação, Finanças, Comércio Eletrônico, Medicina, Auxílio Doméstico'),
    LearnAssistent('Interação',
        'Os Assistentes Virtuais Inteligentes são sistemas que aprendem cada vez mais por meio de interações com o cliente, tornando seu atendimento mais eficaz e resolvendo os problemas dos usuários com maior facilidade. Logo, esses sistemas ficam em constante evolução e buscam sempre uma forma mais humanizada de ajudar. Assistentes virtuais fazem uso do processamento de linguagem natural para reconhecer o comando de voz e realizar um comando válido. Isso faz com que o atendimento aos consumidores seja mais personalizado podendo, por exemplo, encontrar erros gramaticais e a partir da interpretação desse erros oferecer uma resposta satisfatória ao usuário do assistente.'),
    LearnAssistent('Interação',
        'É possível interagir com um assistente pessoal inteligente via texto ou via voz. A voz é reconhecida por um comando padrão, como "E aí Siri" para a assistente virtual Siri, ou "OK, Google" para aplicações da Google. Para que a interação entre os assistentes de voz e seus usuários ocorra em sua plenitude é necessária uma boa conexão à internet. De preferência, o dispositivo utilizado precisa estar conectado com uma rede Wi-Fi ou com uma conexão de dados móveis de qualidade e confiança. Sem internet, os benefícios que um assistente proporciona ficam indisponíveis e seus usuários são obrigados a resolverem seus problemas de outra maneira.'),
    LearnAssistent('Serviços',
        'Há alguns anos atrás a existência de assistentes virtuais era vista como algo muito futurista e difícil de se alcançar. Apesar de ter muito o que melhorar com mais avanços, essa tecnologia já é implementada em atividades triviais e já começa a mostrar seu potencial. A Siri do IOS e a Google assistente do android, por exemplo, oferecem diversos tipos de serviços e podem ser consultadas por uma vasta quantidade de assuntos. A Siri envia e-mails, manda mensagens, mostra a previsão do tempo, etc. Já o Google Assistente é mais voltado para pesquisas, dicas, ativação de alarme, criação de eventos, entre outras coisas. Esses dois exemplos possuem muitas características em comum e ajudam seus usuários no que é possível.'),
    LearnAssistent('Tipos de Assistente',
        'Os assistentes virtuais inteligentes disponíveis no mercado podem ser classificados por tipos que variam conforme os atributos que cada um possui, podendo ser classificados conforme: Comportamento - Passivos, Dinâmicos, Dinâmicos com Gatilho; Propósito - Gerais e Especializados; Observação - Proativos e Reativos; Apresentação - Com Avatar ou Sem Avaar; Comunicação - Sociáveis ou Indiferentes; Integração - Integrados e Não Integrados.'),
  ];

  String getTitle() {
    return _learnData[_pageNumber].title;
  }

  String getText() {
    return _learnData[_pageNumber].text;
  }

  void nextPage() {
    if (_pageNumber < _learnData.length - 1) {
      _pageNumber++;
    }
  }

  void previousPage() {
    if (_pageNumber <= _learnData.length - 1 && _pageNumber != 0) {
      _pageNumber--;
    }
  }
}
