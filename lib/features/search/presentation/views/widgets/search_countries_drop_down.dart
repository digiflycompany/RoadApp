import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/features/search/presentation/cubit/search_cubit.dart';

class SearchCountriesDropDown extends StatefulWidget {
  const SearchCountriesDropDown({super.key, required this.hint, required this.label});

  final String hint,label;

  @override
  State<SearchCountriesDropDown> createState() => _SearchCountriesDropDownState();
}

class _SearchCountriesDropDownState extends State<SearchCountriesDropDown> {
  late ScrollController _scrollController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeScrollController();
  }

  void _initializeScrollController() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    try {
      final cubit = context.read<SearchCubit>();
      if (cubit.state is! CountriesDropDownLoadingMoreState && !_isLoading) {
        _setLoadingState(true);

        await cubit.fetchCountriesDropDown(
          page: cubit.countryDropDownPage + 1,
          more: true,
        );
        await Future.delayed(const Duration(milliseconds: 300));

        _setLoadingState(false);
      }
    } catch (e) {
      debugPrint('Error loading more data: $e');
      _setLoadingState(false);
    }
  }

  void _setLoadingState(bool isLoading) {
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _isLoading = isLoading;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = SearchCubit.get(context);
        final countriesList = cubit.countryDropDown ?? [];

        _updateSelectedCountryName(cubit, countriesList);

        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              _buildDropdownContainer(cubit, countriesList, state),
            ],
          ),
        );
      },
    );
  }

  void _updateSelectedCountryName(SearchCubit cubit, List countriesList) {
    if (countriesList.isNotEmpty && cubit.selectedCountryName != null) {
      cubit.selectedCountryName = countriesList
          .firstWhere(
            (country) => country.name == cubit.selectedCountryName,
        orElse: () => null!,
      )
          .name;
    }
  }

  Widget _buildDropdownContainer(SearchCubit cubit, List countriesList, SearchState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 10),
        ),
        Container(
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Stack(
            children: [
              if (_isLoading || cubit.isLoadingCountries)
                const Center(child: CircularProgressIndicator(strokeWidth: 1.5))
              else
                _buildDropdownButton(cubit, countriesList),
              if (state is CountriesDropDownLoadingMoreState)
                const Center(child: CircularProgressIndicator(strokeWidth: 1.5)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownButton(SearchCubit cubit, List countriesList) {
    return DropdownButton<String>(
      isExpanded: true,
      underline: const SizedBox.shrink(),
      value: cubit.selectedCountryName,
      hint: Text(
        cubit.selectedCountryName ?? widget.hint,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xffAAAAAA),
        ),
      ),
      items: [
        ..._buildDropdownItems(countriesList),
        _buildLoadMoreItem(),
      ],
      onChanged: (val) {
        _onDropdownChanged(val, cubit);
      },
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List countriesList) {
    return countriesList.map((country) {
      return DropdownMenuItem<String>(
        value: country.name,
        child: Text(
          country.name.toString(),
          style: const TextStyle(fontSize: 10),
        ),
      );
    }).toList();
  }

  DropdownMenuItem<String> _buildLoadMoreItem() {
    return DropdownMenuItem<String>(
      value: 'load_more',
      child: Center(
        child: GestureDetector(
          onTap: () {
            if (!_isLoading) {
              _loadMoreData();
            }
          },
          child: const Text(
            'Load More',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _onDropdownChanged(String? val, SearchCubit cubit) {
    if (val == 'load_more') {
      _loadMoreData();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            cubit.selectedCountryName = val;
          });
          debugPrint('Selected Country: ${cubit.selectedCountryName}');
        }
      });
    }
  }
}