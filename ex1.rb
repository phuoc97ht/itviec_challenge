User.select("*, (select count(*) from posts where posts.user_id=users.id) as post_count")
    .order("post_count desc")
# This query is slow because it uses a subquery to calculate the total number of posts for each user in the query.
# The subquery will scan through all the records of posts multiple times.
User.left_joins(:posts)
    .select('users.*, COUNT(posts.id) AS post_count')
    .group('users.id')
    .order('post_count DESC')