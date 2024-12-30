import 'package:techbiz_rfid/src/common/db/app_database.dart';
import 'package:techbiz_rfid/src/import/domain/interface/import_repository.dart';

class ImportRepositoryImpl implements ImportRepository {
  final AppDatabase appDatabase;

  const ImportRepositoryImpl({required this.appDatabase});

  @override
  void insertImportDataFromExcel() {
    // TODO: implement insertImportDataFromExcel
  }
}
