
import 'package:amplify_flutter/amplify_flutter.dart';

import 'Post.dart';

class PostDao {
  Future<List<Post?>?> listPosts() async {
    const listPosts = 'listPosts';
    const graphQLDocument = '''
    query MyQuery {
        listPosts {
          nextToken
          items {
            content
            id
          }
        }
    }
    ''';
    final getPostRequest = GraphQLRequest<PaginatedResult<Post>>(
      document: graphQLDocument,
      modelType: PaginatedModelType(Post.classType),
      decodePath: listPosts,
    );
    final response =
    await Amplify.API.query(request: getPostRequest).response;
    return response.data?.items;
  }
}