abstract class HomeController {
  abstract final List<String> members;
}

class HomeControllerImpl implements HomeController {
  @override
  final List<String> members = [
    'André Lucas do Nascimento dos Santos',
    'Daniel Barbosa Bastos',
    'Daniel Sousa Duplat',
    'Felipe Azevedo Ribeiro',
    'João Pedro de Lima Oliveira',
  ];
}
