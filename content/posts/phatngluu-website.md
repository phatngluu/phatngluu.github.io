# phatngluu.website
This is personal web project about:

- Blog: post/edit markdown, preview and publish as html/css to view
- Note: store/search/edit written notes.
- Todo: input todos, remind via web/push noti/email, sync to calendar
~- Calendar view: sync with calendar to display task/meeting/... items~

## Architecture
### Backend

- Blog: 
  - API to GET/POST/PUT/DELETE .md files. 
  - Database to store .md files
- Note:
  - API to GET/POST/PUT/DELETE notes
  - Search service
  - API to publish a note as a blog post
- Todo: 
  - API to GET/POST/PUT/DELETE todos
  - Reminder service
  - Sync to calendar service
- Calendar:
  - Sync data from calendar API

### Frontend
- Blog:
    - Seamless markdown editor
    - Paste image/drop from clipboard/url, then convert to base64, embedded it directly in markdown file. [Link](https://medium.com/markdown-monster-blog/getting-images-into-markdown-documents-and-weblog-posts-with-markdown-monster-9ec6f353d8ec)
-