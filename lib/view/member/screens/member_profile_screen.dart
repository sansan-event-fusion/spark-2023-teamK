import 'package:flutter/material.dart';

class MemberProfileScreen extends StatelessWidget {
  MemberProfileScreen(
      {super.key, required this.memberImageUrl, required this.memberName});

  final String memberImageUrl;
  final String memberName;
  final List<String> memberPostImageUrlList = [
    "https://cdn.pixabay.com/photo/2016/11/10/14/00/cycling-1814362_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/08/02/10/00/road-bikes-1562929_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/11/18/10/36/road-1833925_1280.jpg",
    "https://cdn.pixabay.com/photo/2020/08/09/16/23/cyclists-5475979_1280.jpg",
    "https://cdn.pixabay.com/photo/2016/10/06/07/56/girl-1718430_1280.jpg",
    "https://cdn.pixabay.com/photo/2013/03/19/18/23/mountain-biking-95032_1280.jpg",
    "https://cdn.pixabay.com/photo/2017/04/26/17/58/road-bike-2263202_1280.jpg",
    "https://cdn.pixabay.com/photo/2018/06/11/21/50/road-bike-3469503_1280.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("プロフィール"),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  memberImageUrl,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(memberName),
              ),
            ],
          ),
        ),
        //TODO: 自己紹介文は内容を固定しているため、Member ごとのプロフィールに変更
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
              "こんにちは、佐藤と申します。私は高校時代から自転車に魅了され、大学に入ってからは「アドベンチャーシーカーズ」に参加しました。自転車を通じて日本の美しい風景を発見するのが好きです。特に長野県の山々をサイクリングするのがお気に入りです。このサークルでは、新しい場所を発見するだけでなく、自分の体力の限界に挑戦することも楽しんでいます。週末のロングライドや初心者向けの講習を一緒に楽しんでくれる新しい仲間をいつも探しています！"),
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("投稿一覧"),
          ),
        ),
        //TODO: 個人投稿は内容を固定しているため、Member ごとの投稿に変更
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: memberPostImageUrlList.length,
          itemBuilder: (context, index) {
            return SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                height: MediaQuery.of(context).size.width * 0.32,
                child: Image.network(
                  memberPostImageUrlList[index],
                  fit: BoxFit.cover,
                ));
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ]),
    );
  }
}
