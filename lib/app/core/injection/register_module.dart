import 'package:flutter_modular/flutter_modular.dart';
import 'package:graphql_flutter/graphql_flutter.dart' as graphql;
import 'package:mobx/mobx.dart';

part 'register_module.g.dart';

@Injectable()
class RegisterModule = _RegisterModuleBase with _$RegisterModule;

abstract class _RegisterModuleBase with Store {
  _RegisterModuleBase();

  @computed
  graphql.GraphQLClient get gqlClient {
    final graphql.HttpLink httpLink = graphql.HttpLink(
      'https://staging-nu-needful-things.nubank.com.br/query',
    );

    final graphql.AuthLink authLink = graphql.AuthLink(
      getToken: () async =>
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c',
    );

    final graphql.Link link = authLink.concat(httpLink);

    return graphql.GraphQLClient(
      cache: graphql.GraphQLCache(),
      link: link,
    );
  }
}
