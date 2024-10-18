import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:untitled/features/domain/entities/nasa_article_entity.dart';
import 'package:untitled/features/presentation/bloc/nasa_article/local/local_nasa_article_bloc.dart';
import 'package:untitled/features/presentation/bloc/nasa_article/local/local_nasa_article_state.dart';
import '../../../../../../injection_container.dart';
import '../../../bloc/nasa_article/local/local_nasa_article_event.dart';
import '../../../widgets/nasa_article_tile.dart';
import '../../../widgets/nasa_article_widget.dart';

class SavedNasaArticlesPage extends HookWidget{
  const SavedNasaArticlesPage({Key ? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalNasaArticleBloc>()..add(GetSavedNasaArticlesEvent()),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: const Icon(Ionicons.chevron_back),
        ),
      ),
      title:  Text('Saved Nasa Articles', style: Theme.of(context).textTheme.displayLarge),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalNasaArticleBloc, LocalNasaArticleState>(
      builder: (context, state) {
        if (state is LocalNasaArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalNasaArticleDone) {
          return _buildArticlesList(state.nasaArticles!,context);
        }
        return ColoredBox(color: Colors.red);
      },
    );
  }

  Widget _buildArticlesList(List<NasaArticleEntity> articles,BuildContext context) {
    if (articles.isEmpty) {
      return Center(
          child: Text(
            'NO SAVED ARTICLES',
            style: Theme.of(context).textTheme.titleLarge,
          ));
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return NasaArticleWidget(
          article: articles[index],
          isRemovable: true,
          onRemove: (article) => _onRemoveArticle(context, article),
        );
      },
    );
  }



  void _onRemoveArticle(BuildContext context, NasaArticleEntity article) {
    BlocProvider.of<LocalNasaArticleBloc>(context).add(RemoveNasaArticleEvent(article));
  }

  void _onArticlePressed(BuildContext context, NasaArticleEntity article) {
    Navigator.pushNamed(context, '/SavedNasaArticles', arguments: article);
  }
}