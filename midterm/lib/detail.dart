import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'model/hotel.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.hotel}) : super(key: key);

  static const String routeName = '/detail';

  final Hotel hotel;

  static String heroTag(Hotel hotel) => 'hotel-hero-${hotel.id}';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final Hotel hotel = widget.hotel;
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Detail'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onDoubleTap: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                      child: Hero(
                        tag: DetailPage.heroTag(hotel),
                        child: SizedBox(
                          width: double.infinity,
                          height: 285.0,
                          child: Image.asset(
                            hotel.assetName,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    right: 10.0,
                    child: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22.0, 18.0, 22.0, 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: List<Widget>.generate(
                        3,
                        (_) => const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 250.0,
                      child: DefaultTextStyle(
                        style: theme.textTheme.headlineSmall!.copyWith(
                          color: const Color.fromARGB(255, 1, 16, 223),
                          fontWeight: FontWeight.bold,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              hotel.name,
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          totalRepeatCount: 1,
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ),
                    ),
                  
                    const SizedBox(height: 14.0),
                    _InfoRow(
                      icon: Icons.location_on,
                      text: hotel.address,
                    ),
                    const SizedBox(height: 8.0),
                    _InfoRow(
                      icon: Icons.phone,
                      text: hotel.phone,
                    ),
                    const SizedBox(height: 18.0),
                    Divider(color: Colors.grey.shade300),
                    const SizedBox(height: 14.0),
                    Text(
                      hotel.description,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.blueGrey,
                        height: 1.55,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.lightBlue,
          size: 20.0,
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.lightBlue,
            ),
          ),
        ),
      ],
    );
  }
}
