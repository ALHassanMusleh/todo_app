import 'package:flutter/material.dart';

class MessengerListviewScreen extends StatelessWidget {
  const MessengerListviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: const Row(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/80463251?v=4',
                  ),
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 15,
              child: Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              radius: 15,
              child: Icon(
                Icons.edit,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Search'),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  //بتعطيني حاجتين
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                  itemCount: 10,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 1. build item (resusable item)
  // 2. build list
  // 3. build item to list
  // arrow function
  Widget buildChatItem() => Row(
        children: [
          const Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/80463251?v=4',
                ),
              ),
              // CircleAvatar(
              //   radius: 9,
              //   backgroundColor: Colors.white,
              // ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 3,
                  end: 3,
                ),
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Alhassan mMuslehAlhassan mMuslehAlhassan mMuslehAlhassan mMusleh',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Hello Hello hassan Hello hassan hassan Hello hassan hassan Hello hassan',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const Text('10:58 pm'),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  Widget buildStoryItem() => Container(
        width: 60,
        child: const Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/80463251?v=4',
                  ),
                ),
                // CircleAvatar(
                //   radius: 9,
                //   backgroundColor: Colors.white,
                // ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    bottom: 3,
                    end: 3,
                  ),
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'Alhassan Musleh Alhassan Musleh',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
