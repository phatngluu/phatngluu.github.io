#### Lesson learned Android

- Khi chuyển từ Activity X (có chứa button A) này sang Activity Y (chứa button B), khi nhấn button A để chuyển từ X sang Y, thì có thể vô tình button B cũng sẽ bị nhấn (? chưa hiểu tại sao). Giải pháp: trong Android Manifest, phần khai báo <activity…> chèn vào: android:launchMode = "singleTop"

  Ví dụ: 

  ```xml
  <activity

  android:name=".PlayerBookingActivity"

  android:label="My Bookings"

  android:launchMode="singleTop"/>
  ```

- Volley có thể kết hợp với JSONArray, JSONObject. Bộ đôi này rất mạnh, volley trả về response dưới dạng text hoặc JSONArray, JSONObject.

- Volley Request có Response.Listener và Response.ErrorListener rất mạnh, dùng để handle khi nhận được response và không nhận được response

- Mình có thể pass một JSONArray/Object từ activity này sang activity khác bằng cách convert nó sang String rồi Intent.putExtra.

- Trường hợp nhấn button để get data và chuyển sang activity khác để show data thì: mình có thể set on click listener gọi request lấy data. Với Volley ResponseListener: truyền data sang activity mới và chuyển sang activity mới. Với ErrorListener: thông báo có lỗi và không chuyển sang activity mới.