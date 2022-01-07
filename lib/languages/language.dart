import 'package:get/get_navigation/src/root/internacionalization.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Good day,\nKhakim Azimov 👋',
          'come': 'Upcoming events',
          'worktime': 'Appointment at',
          'today': 'Today’s prescriptions'
        },
        'uz_UZ': {
          'hello': 'Yaxshi kun,\nKhakim Azimov 👋',
          'come': 'Kelgusi tadbirlar',
          'worktime': 'Uchrashuv vaqti',
          'today': 'Bugungi retseptlar'
        }
      };
}
