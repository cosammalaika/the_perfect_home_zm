// ignore_for_file: avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'custom_image.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(this.chatData,
      {Key? key, this.onTap, this.isNotified = true, this.profileSize = 50})
      : super(key: key);
  final chatData;
  final bool isNotified;
  final GestureTapCallback? onTap;
  final double profileSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(
                  chatData['image'],
                  width: profileSize,
                  height: profileSize,
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Container(
                        child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                child: Text(chatData['name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700)))),
                        const SizedBox(width: 5),
                        Container(
                            child: const Icon(
                          Icons.remove_red_eye_outlined,
                          size: 10,
                          color: Colors.grey,
                        )),
                        const SizedBox(width: 3),
                        Container(
                            child: Text(chatData['date'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.grey)))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(chatData['last_text'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 13))),
                        // if(isNotified)
                        //   Padding(
                        //     padding: const EdgeInsets.only(right: 5),
                        //     child: NotifyBox(number: chatData['notify'], boxSize: 17,),
                        //   )
                      ],
                    ),
                  ],
                ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
