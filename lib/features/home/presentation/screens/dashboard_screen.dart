import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/customer_provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/balance_card.dart';
import '../widgets/dashboard_app_bar.dart' show DashboardHeader;
import '../widgets/home_empty_state.dart';
import '../widgets/quick_actions_row.dart';
import '../widgets/summary_pills.dart';
import '../widgets/transaction_list_tile.dart';

abstract final class _Dims {
  static const double sectionGap    = 16.0;
  static const double listHeaderGap = 8.0;
  static const double appBarGap     = 8.0;
}

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  bool _isMasked = false;

  @override
  Widget build(BuildContext context) {
    final l10n         = AppLocalizations.of(context)!;
    final cs           = Theme.of(context).colorScheme;
    final tt           = Theme.of(context).textTheme;
    final customers    = ref.watch(customerProvider);
    final transactions = ref.watch(transactionProvider);

    final netBalance  = customers.fold(0.0, (sum, c) => sum + c.netBalance);
    final totalIncome = customers
        .where((c) => c.netBalance > 0)
        .fold(0.0, (sum, c) => sum + c.netBalance);
    final totalExpense = customers
        .where((c) => c.netBalance < 0)
        .fold(0.0, (sum, c) => sum + c.netBalance.abs());

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        bottom: false,
        child: customers.isEmpty
            ? HomeEmptyState(onAddCustomer: () {})
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: _Dims.appBarGap),
                        const DashboardHeader(),
                        const SizedBox(height: _Dims.sectionGap),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.buttonPaddingH,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BalanceCard(
                                netBalance: netBalance,
                                isMasked: _isMasked,
                                onToggleMask: () =>
                                    setState(() => _isMasked = !_isMasked),
                              ),
                              const SizedBox(height: _Dims.sectionGap),
                              SummaryPills(
                                totalIncome: totalIncome,
                                totalExpense: totalExpense,
                                isMasked: _isMasked,
                              ),
                              const SizedBox(height: _Dims.sectionGap),
                              const QuickActionsRow(),
                              const SizedBox(height: _Dims.sectionGap),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      l10n.homeRecentTransactions,
                                      style: tt.titleMedium?.copyWith(
                                        color: cs.onSurface,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(l10n.homeSeeAll),
                                  ),
                                ],
                              ),
                              const SizedBox(height: _Dims.listHeaderGap),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.buttonPaddingH,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => TransactionListTile(
                          transaction: transactions[index],
                          isMasked: _isMasked,
                        ),
                        childCount: transactions.length,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 96)),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: l10n.homeAddEntry,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
