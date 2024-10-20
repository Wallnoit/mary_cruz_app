import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../news/models/news_model.dart';

class InfoContainer extends StatefulWidget {
  final NewsModel news;
  final Widget footer;

  const InfoContainer(
      {super.key,
        required this.news,
        required this.footer,
      });

  @override
  State<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.grey,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: widget.news.urlImagen,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter:
                    ColorFilter.mode(Colors.red, BlendMode.dstIn)),
              ),
            ),
            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(value: downloadProgress.progress),
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,

          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.news.titulo,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.news.descripcion,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                widget.footer,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
