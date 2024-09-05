// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResponseModelAdapter extends TypeAdapter<ResponseModel> {
  @override
  final int typeId = 0;

  @override
  ResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResponseModel(
      id: fields[0] as String,
      question: fields[1] as String,
      solutionSteps: (fields[2] as List).cast<String>(),
      result: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ResponseModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.solutionSteps)
      ..writeByte(3)
      ..write(obj.result);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
