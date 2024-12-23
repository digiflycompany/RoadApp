import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:roadapp/features/search/presentation/cubit/search_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarBrandDropDown extends StatefulWidget {
  const CarBrandDropDown({super.key, required this.label, required this.hint});

  final String label, hint;

  @override
  State<CarBrandDropDown> createState() => _CarBrandDropDownState();
}

class _CarBrandDropDownState extends State<CarBrandDropDown> {
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
      if (cubit.state is! CarBrandDropDawnLoadingMoreState && !_isLoading) {
        _setLoadingState(true);

        await cubit.fetchCarBrand(
          page: cubit.carBrandPage + 1,
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
    return  BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = SearchCubit.get(context);
        final carBrandList = cubit.carBrandList ?? [];

        _updateSelectedCarBrandName(cubit, carBrandList);

        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(height: 4),
              _buildDropdownContainer(cubit, carBrandList, state),
            ],
          ),
        );
      },
    );
  }

  void _updateSelectedCarBrandName(SearchCubit cubit, List carBrandList) {
    if (carBrandList.isNotEmpty && cubit.selectedCarBrandId != null) {
      cubit.selectedCarBrandName = carBrandList
          .firstWhere(
            (brand) => brand.id == cubit.selectedCarBrandId,
        orElse: () => null!,
      )
          .name;
    }
  }

  Widget _buildDropdownContainer(SearchCubit cubit, List carBrandList, SearchState state) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        children: [
          if (_isLoading || cubit.isLoadingCarBrand)
            const Center(child: CircularProgressIndicator(strokeWidth: 1.5))
          else
            _buildDropdownButton(cubit, carBrandList),
          if (state is CarBrandDropDawnLoadingMoreState)
            const Center(child: CircularProgressIndicator(strokeWidth: 1.5)),
        ],
      ),
    );
  }

  Widget _buildDropdownButton(SearchCubit cubit, List carBrandList) {
    return DropdownButton<String>(
      isExpanded: true,
      underline: const SizedBox.shrink(),
      value: cubit.selectedCarBrandId,
      hint: Text(
        cubit.selectedCarBrandName ?? widget.hint,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xffAAAAAA),
        ),
      ),
      items: [
        ..._buildDropdownItems(carBrandList),
        _buildLoadMoreItem(),
      ],
      onChanged: (val) {
        _onDropdownChanged(val, cubit);
      },
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List carBrandList) {
    return carBrandList.map((brand) {
      return DropdownMenuItem<String>(
        value: brand.id,
        child: Text(
          brand.name,
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
            cubit.selectedCarBrandId = val;
          });
          debugPrint('Selected Car Brand: ${cubit.selectedCarBrandName}');
          debugPrint('Selected Car ID: ${cubit.selectedCarBrandId}');

        }
      });
    }
  }
}
