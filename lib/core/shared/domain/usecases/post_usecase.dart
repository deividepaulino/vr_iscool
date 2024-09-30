abstract class PostUsecase<Result, Entity> {
  Result call(
    Entity entity,
  );
}
