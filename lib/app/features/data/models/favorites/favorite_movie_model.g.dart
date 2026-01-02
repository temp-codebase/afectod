// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteMovieModelAdapter extends TypeAdapter<FavoriteMovieModel> {
  @override
  final typeId = 0;

  @override
  FavoriteMovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteMovieModel(
      id: (fields[0] as num).toInt(),
      title: fields[1] as String,
      posterPath: fields[2] as String?,
      backdropPath: fields[3] as String?,
      overview: fields[4] as String?,
      voteAverage: (fields[5] as num?)?.toDouble(),
      releaseDate: fields[6] as String?,
      genreIds: (fields[7] as List?)?.cast<int>(),
      addedAt: fields[8] as DateTime,
      popularity: (fields[9] as num?)?.toDouble(),
      voteCount: (fields[10] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteMovieModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.backdropPath)
      ..writeByte(4)
      ..write(obj.overview)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.releaseDate)
      ..writeByte(7)
      ..write(obj.genreIds)
      ..writeByte(8)
      ..write(obj.addedAt)
      ..writeByte(9)
      ..write(obj.popularity)
      ..writeByte(10)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteMovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
