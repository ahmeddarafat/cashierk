// import 'package:start_app/data/constants/api_constants.dart';
// import 'package:start_app/data/data_source/remote/api_service.dart';

// class NotificationRepository {
//   final ApiService apiService;

//   NotificationRepository(this.apiService);

//   void sendMessage({
//     required String title,
//     required String body,
//     required String token,
//   }) {
//     apiService.postData(
//       endPoint: EndPoints.fcmSend,
//       body: {
//         "to":
//             "cEsXisyDSaSQ9rLT0CSXWw:APA91bGjnF9MPFUV-K0coiL8ZjlvaeDu1zByZ9m0FjNI2_X81CgE_oeMe7u2SOxld9g_34VtPLjujYw5IUd9NYJ4DZoLi5wsLcTMK0vXXu_fWbAQYNNVDWpmklFJmgeo3zSDX-8IfZ70",
//         // "priority": "high",
//         "notification": {
//           "title": title,
//           "body": body,
//           // "android_channel_id": "high_important_channel",
//           // "sound": "default",
//         },
//         'data': {
//           "title": title,
//           "body": body,
//           "description": "I did it",
//         }
//       },
//     );
//   }
// }
