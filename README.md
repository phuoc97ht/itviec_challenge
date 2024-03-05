# itviec_challenge
ruby 3.3.0
Rails 7.1.3.2

# Workflow
Step 1: Initialize a key in Redis with the code of a post and a value of 0.
Step 2: When a user accesses the post, this value will be accumulated in Redis based on the post's code.
Step 3: Create a background job to run every hour or every half hour, with the purpose of iterating through all posts and updating the total_views value based on the post's code.
Step 4:Display total_views on the UI.
