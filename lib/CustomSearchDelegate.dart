import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget>? buildActions(BuildContext context) {
    //Define as ações que o usuário ode utilizar

    return [
      IconButton(onPressed: (){query = "";}, icon: Icon(Icons.clear, color: Colors.black))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //Define o botão de voltar
    return Center(
      child: Column(
        children: <Widget>[
          IconButton(onPressed: (){close(context, "");}, icon: Icon(Icons.arrow_back, color: Colors.black))
        ],
      ),
    );

  }

  @override
  Widget buildResults(BuildContext context) {
    //Constróis os resultados
    //print("Resultado: pesquisa realizada");
    close(context, query);
    return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //Define sugestões de pesquisas
    //print("Resultado: "+query);

    List<String> lista = [];
    if(query.isNotEmpty){
      lista = [];

      return ListView.builder(itemCount:lista.length,itemBuilder: (context, index){
        return ListTile(
          title: Text(lista[index]),
        );
      });
    } else{
      return Text('Nenhum resultado para a pesquisa.');
    }
  }

}