# flutter_space_x video demo



https://user-images.githubusercontent.com/6002066/212633635-84a806c6-b7a4-489d-b0b2-be4656187946.mp4



## About the project

1. I have used provider for state management, Dio for http. requests and shared preference for persisting data between sessions.
2. I was not able to implement countdown timer as every launch is in past and thus countdown doesn't make sense in this context. But its not a big deal and I can implement one with a random date and time in future.
3. There were many null objects for upcoming launches, so I have added fallback for them. For example if there is no reddit thread, the user will go to the spacex subreddit.
4. All other features are present, user can favorite launches which wiill persist between sessions, they can refresh the request and so on.

## Next steps that can be added

1. Use caching system of Dio to reduce unwanted requests.
2. Use NamedRoutes
3. More improvements in UI, possibly use Cupertino widgets for iOS.

## Few screenshots

![Simulator Screen Shot - iPhone 14 Pro Max - 2023-01-16 at 13 40 00](https://user-images.githubusercontent.com/6002066/212633746-fba8d71a-d1c0-40a5-87a9-418c110cd6a3.png)
![Simulator Screen Shot - iPhone 14 Pro Max - 2023-01-16 at 13 40 11](https://user-images.githubusercontent.com/6002066/212633754-e5321511-dbaf-44c7-b5da-37e92b22f3a1.png)
![Simulator Screen Shot - iPhone 14 Pro Max - 2023-01-16 at 13 40 21](https://user-images.githubusercontent.com/6002066/212633758-01bd2971-f24b-41d6-ad59-209c24621023.png)
![Simulator Screen Shot - iPhone 14 Pro Max - 2023-01-16 at 13 40 28](https://user-images.githubusercontent.com/6002066/212633763-6ab9ae6e-65d2-4326-bd6f-dec8af525eb2.png)
