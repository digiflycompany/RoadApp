import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import '../cubit/maintenance_service_type_cubit.dart';

class CarBrandDropDown extends StatefulWidget {
  const CarBrandDropDown({super.key, required this.hint});

  final String hint;

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
      final cubit = context.read<MaintenanceServiceTypeVendorCubit>();
      if (cubit.state is! CarBrandDropDawnLoadingMoreState && !_isLoading) {
        _setLoadingState(true);

        await cubit.fetchCarBrand(page: cubit.carBrandPage + 1, more: true);
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
    return BlocBuilder<MaintenanceServiceTypeVendorCubit, MaintenanceServiceTypeVendorState>(
      builder: (context, state) {
        final cubit = MaintenanceServiceTypeVendorCubit.get(context);
        final nameClientList = cubit.carBrandList ?? [];

        _updateSelectedCarBrandName(cubit, nameClientList);

        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              _buildDropdownContainer(cubit, nameClientList, state),
            ],
          ),
        );
      },
    );
  }

  void _updateSelectedCarBrandName(cubit, List nameClientList) {
    if (nameClientList.isNotEmpty && cubit.selectedCarBrandId != null) {
      cubit.selectedCarBrandName = nameClientList
          .firstWhere(
            (product) => product.id == cubit.selectedCarBrandId,
        orElse: () => null!,
      )
          .name;
    }
  }

  Widget _buildDropdownContainer(cubit, List nameClientList, state) {
    return Container(
      height: 35,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        children: [
          if (_isLoading || cubit.isLoadingCarBrand)
            const Center(child: CircularProgressIndicator(strokeWidth: 1.5))
          else
            _buildDropdownButton(cubit, nameClientList),
          if (state is CarBrandDropDawnLoadingMoreState)
            const Center(child: CircularProgressIndicator(strokeWidth: 1.5)),
        ],
      ),
    );
  }

  Widget _buildDropdownButton(cubit, List nameClientList) {
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
        ..._buildDropdownItems(nameClientList),
        _buildLoadMoreItem(),
      ],
      onChanged: (val) {
        _onDropdownChanged(val, cubit);
      },
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems(List nameClientList) {
    return nameClientList.map((product) {
      return DropdownMenuItem<String>(
        value: product.id,
        child: Text(
          product.name.toString(),
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
            AppNavigation.back();
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

  void _onDropdownChanged(String? val, cubit) {
    if (val == 'load_more') {
      _loadMoreData();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            cubit.selectedCarBrandId = val;
          });
          debugPrint('${cubit.selectedCarBrandName} : ${cubit.selectedCarBrandId}');
        }
      });
    }
  }
}
