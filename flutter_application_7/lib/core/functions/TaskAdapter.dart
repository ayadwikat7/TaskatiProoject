import 'package:flutter_application_7/core/functions/TaskModle.dart';
import 'package:hive/hive.dart';

class Taskadapter extends TypeAdapter<Taskmodle> {
  
  @override
  Taskmodle read(BinaryReader reader) {
    // TODO: implement read
    return Taskmodle(
        id: reader.readString(),
        Title: reader.readString(),
        Note: reader.readString(),
        StartTime: reader.readString(),
        EndTime: reader.readString(),
        isCompleted: reader.readBool(),
        Color: reader.readInt(),
        Date: reader.readString());
  }

  @override
  // TODO: implement typeId
  final int typeId = 0;
  

  @override
  void write(BinaryWriter writer, Taskmodle obj) {
    writer.write(obj.id);
    writer.write(obj.Title);
    writer.write(obj.Note);
    writer.write(obj.StartTime);
    writer.write(obj.EndTime);
    writer.write(obj.isCompleted);
    writer.write(obj.Color);
    writer.write(obj.Date);
  }
}
