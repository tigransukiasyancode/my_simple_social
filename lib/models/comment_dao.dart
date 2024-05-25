import 'package:amplify_flutter/amplify_flutter.dart';
import 'Comment.dart';

class CommentDao {
  Future<List<Comment>> listComments() async {
    const listComments = 'listComments';
    const graphQLDocument = '''
    query MyQuery {
        listComments {
          items {
            content
            id
          }
        }
    }
    ''';
    final getCommentRequest = GraphQLRequest<PaginatedResult<Comment>>(
      document: graphQLDocument,
      modelType: PaginatedModelType(Comment.classType),
      decodePath: listComments,
    );
    final response = await Amplify.API.query(request: getCommentRequest).response;
    return response.data?.items.nonNulls.toList() ?? [];
  }
}