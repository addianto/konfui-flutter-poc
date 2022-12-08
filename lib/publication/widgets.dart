import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'models.dart';

final _log = Logger('publication/widgets');

class PublicationListItem extends StatelessWidget {
  const PublicationListItem({super.key, required this.publication, this.onTap});

  final Publication publication;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () => onTap!(publication),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.book),
              title: Text(publication.title!),
              subtitle: Text(publication.authors!),
            ),
          ],
        ),
      ),
    );
  }
}

class PublicationList extends StatefulWidget {
  const PublicationList({super.key, required this.publications});

  final Future<List<Publication>> publications;

  @override
  State<StatefulWidget> createState() => _PublicationListState();
}

class _PublicationListState extends State<PublicationList> {
  void publicationOnTapHandler(Publication publication) =>
      _log.fine('Clicked $publication');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Publication>>(
      future: widget.publications,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          _log.severe('There was a problem when loading the data snapshot',
              snapshot.error);
          return const Center(
            child: Text('Unable to load data'),
          );
        }

        if (!snapshot.hasData) {
          _log.warning('Empty data');
          return const Center(
            child: Text('Empty data'),
          );
        }

        _log.fine('Snapshot has loaded all data successfully');
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (_, index) => PublicationListItem(
              publication: snapshot.data![index],
              onTap: (publication) => publicationOnTapHandler(publication)),
        );
      },
    );
  }
}
