import 'package:flutter/material.dart';
import 'package:iu_example/extencion.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final String sampleImageUrl =
      "https://www.pngmart.com/files/7/Chair-PNG-Transparent-Picture.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          Text(
            "Explore",
            style: context.theme.textTheme.headline3,
          ),
          SizedBox(
            height: context.dynamicHeight(0.2),
            child: buildRowCard(),
          ),
          context.emptyWidgetHeight,
          AspectRatio(
            aspectRatio: 10 / 1,
            child: listViewCatagory(),
          ),
          BuildGridViewChairs(sampleImageUrl: sampleImageUrl),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Row buildRowCard() {
    return Row(
      children: [
        Expanded(child: buidCardItem()),
        Expanded(child: buidCardItem()),
        Expanded(child: buidCardItem()),
      ],
    );
  }

  ListView listViewCatagory() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "data ",
        ),
      ),
    );
  }

  Card buidCardItem() {
    return Card(
      child: ListTile(
        title: Image.network(sampleImageUrl),
        subtitle: const Text("Sample text"),
      ),
    );
  }
}

class BuildGridViewChairs extends StatelessWidget {
  const BuildGridViewChairs({
    Key? key,
    required this.sampleImageUrl,
  }) : super(key: key);

  final String sampleImageUrl;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) =>
          ChairsCard(sampleImageUrl: sampleImageUrl),
    );
  }
}

class ChairsCard extends StatelessWidget {
  const ChairsCard({
    Key? key,
    required this.sampleImageUrl,
  }) : super(key: key);

  final String sampleImageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Image.network(
          sampleImageUrl,
        ),
        subtitle: const Text("Title"),
      ),
    );
  }
}
