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

  Future<void> createComment(String newComment, String commentPostId) async {
    const createComment = 'createComment';
    const graphQLDocument = '''
    mutation MyMutation(\$content: String!, \$commentPostId: ID!) {
        createComment(input: {content: \$content, commentPostId: \$commentPostId}) {
          content
          id
        }
    }
    ''';
    final createCommentRequest = GraphQLRequest<Comment>(
      document: graphQLDocument,
      variables: <String, String>{
        'content': newComment,
        'commentPostId': commentPostId,
      },
      decodePath: createComment,
      modelType: Comment.classType,
    );
    var result = await Amplify.API.mutate(request: createCommentRequest).response;
    print(result);
  }
}