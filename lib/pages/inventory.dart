// lib/pages/inventory.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Brand colors — BiasharaPulse Pure Dark Design System
const kBlackBase = Color(0xFF141414); 
const kBlackRich = Color(0xFF0D0D0D); // Pure deep dark black background
const kCardSurface = Color(0xFF181818);
const kOffWhiteText = Color(0xFFF6F4F5);
const kMutedText = Color(0xFFA197A0);
const kBorderSubtle = Color(0xFF282828);

// Brand Accent Colors
const kCherryRed = Color(0xFFDC2626);
const kAmberGold = Color(0xFFD4A373);
const kGreenAccent = Color(0xFF16A34A);
const kAmberWarning = Color(0xFFD97706);
const kBlueAccent = Color(0xFF2563EB);
const kPurpleAccent = Color(0xFF9333EA);

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  String _selectedCategory = 'All';

  // Sample data designed to mimic API response structure from Django backend
  final List<double> _weeklySalesData = [45000, 68000, 52000, 89000, 110000, 128400];
  final List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  final List<Map<String, dynamic>> _sampleProducts = [
    {
      'name': 'Premium Dark Roast Coffee (500g)',
      'sku': 'SKU-BEV-001',
      'category': 'Beverages',
      'location': 'Shelf A-3',
      'costPrice': 'KES 800',
      'sellPrice': 'KES 1,200',
      'margin': '+KES 400 (33%)',
      'stock': 42,
      'reorderPoint': 10,
      'stockCap': 50,
      'supplier': 'Highland Coffee Ltd',
      'status': 'In Stock',
      'statusColor': kGreenAccent,
    },
    {
      'name': 'Organic Green Tea Box',
      'sku': 'SKU-BEV-002',
      'category': 'Beverages',
      'location': 'Shelf A-4',
      'costPrice': 'KES 550',
      'sellPrice': 'KES 850',
      'margin': '+KES 300 (35%)',
      'stock': 5,
      'reorderPoint': 15,
      'stockCap': 30,
      'supplier': 'Tea Leaf Distributors',
      'status': 'Low Stock',
      'statusColor': kAmberWarning,
    },
    {
      'name': 'Whole Grain Wheat Bread',
      'sku': 'SKU-BAK-010',
      'category': 'Bakery',
      'location': 'Display Counter',
      'costPrice': 'KES 110',
      'sellPrice': 'KES 150',
      'margin': '+KES 40 (26%)',
      'stock': 0,
      'reorderPoint': 20,
      'stockCap': 40,
      'supplier': 'City Bakers Kenya',
      'status': 'Out of Stock',
      'statusColor': kCherryRed,
    },
  ];

  final List<Map<String, dynamic>> _stockLogs = [
    {
      'type': 'Stock In',
      'item': 'Premium Dark Roast Coffee',
      'qty': '+20 units',
      'time': 'Today, 09:30 AM',
      'user': 'Admin',
      'color': kGreenAccent,
    },
    {
      'type': 'Waste/Damage',
      'item': 'Whole Grain Wheat Bread',
      'qty': '-2 units',
      'time': 'Yesterday, 04:15 PM',
      'user': 'John',
      'color': kCherryRed,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackRich,
      body: SafeArea(
        child: Column(
          children: [
            // ── Top Navigation Bar ─────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _headerIconButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.orbitron(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.8,
                      ),
                      children: const [
                        TextSpan(
                          text: 'biashara',
                          style: TextStyle(color: kOffWhiteText),
                        ),
                        TextSpan(
                          text: 'pulse',
                          style: TextStyle(color: kCherryRed),
                        ),
                      ],
                    ),
                  ),
                  _headerIconButton(
                    icon: Icons.qr_code_scanner,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // ── Main Scrollable Body ─────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Title & Subtitle
                    Text(
                      'Business Hub',
                      style: GoogleFonts.orbitron(
                        color: kOffWhiteText,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Stock tracking, suppliers, audits, and performance',
                      style: GoogleFonts.inter(
                        color: kMutedText,
                        fontSize: 12,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── 2x2 Header Stat Chips Grid ─────────────────────
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _headerStatChip(
                                icon: Icons.trending_up,
                                label: 'KES 128,400',
                                sub: 'Sales today',
                                accent: kGreenAccent,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _headerStatChip(
                                icon: Icons.inventory_2_outlined,
                                label: '2 Alerts',
                                sub: 'Reorder now',
                                accent: kAmberWarning,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: _headerStatChip(
                                icon: Icons.receipt_long_outlined,
                                label: 'KES 81,350',
                                sub: 'Expenses',
                                accent: kCherryRed,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _headerStatChip(
                                icon: Icons.analytics_outlined,
                                label: 'KES 40,210',
                                sub: 'Profits',
                                accent: kGreenAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ── Quick Action Hub ────────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _actionShortcut(
                          icon: Icons.point_of_sale,
                          label: 'POS',
                          onTap: () {},
                        ),
                        _actionShortcut(
                          icon: Icons.sync_alt_rounded,
                          label: 'Stock In/Out',
                          onTap: () {},
                        ),
                        _actionShortcut(
                          icon: Icons.local_shipping_outlined,
                          label: 'Suppliers',
                          onTap: () {},
                        ),
                        _actionShortcut(
                          icon: Icons.assignment_outlined,
                          label: 'Audits',
                          onTap: () {},
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // ── Performance Analytics Charts Grid ─────────────────
                    _sectionHeader('Performance Overview'),
                    const SizedBox(height: 12),

                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.95,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // Chart 1: Sales Trend Bar Visual
                        _chartContainer(
                          title: 'Sales Growth',
                          subtitle: 'Daily revenue trend',
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: List.generate(
                                    _weeklySalesData.length,
                                    (index) {
                                      final maxVal = 130000.0;
                                      final heightFactor =
                                          (_weeklySalesData[index] / maxVal)
                                              .clamp(0.15, 1.0);
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 12,
                                            height: 60 * heightFactor,
                                            decoration: BoxDecoration(
                                              color: index ==
                                                      _weeklySalesData.length -
                                                          1
                                                  ? kGreenAccent
                                                  : kBorderSubtle,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            _weekDays[index],
                                            style: GoogleFonts.inter(
                                              color: kMutedText,
                                              fontSize: 8.5,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Chart 2: Payment Methods Share Ring/Pie
                        _chartContainer(
                          title: 'Payment Split',
                          subtitle: 'M-Pesa vs Cash',
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 65,
                                  height: 65,
                                  child: CircularProgressIndicator(
                                    value: 0.765,
                                    strokeWidth: 8,
                                    backgroundColor: kAmberGold,
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                        kGreenAccent),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '76.5%',
                                      style: GoogleFonts.orbitron(
                                        color: kOffWhiteText,
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      'M-Pesa',
                                      style: GoogleFonts.inter(
                                        color: kMutedText,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Chart 3: Stock Share by Category
                        _chartContainer(
                          title: 'Category Volume',
                          subtitle: 'Inventory share',
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _categoryDistributionRow('Beverages', 0.55, kBlueAccent),
                              const SizedBox(height: 8),
                              _categoryDistributionRow('Bakery', 0.30, kCherryRed),
                              const SizedBox(height: 8),
                              _categoryDistributionRow('Snacks', 0.15, kPurpleAccent),
                            ],
                          ),
                        ),

                        // Chart 4: Profit Margin Sparkline Visual
                        _chartContainer(
                          title: 'Profit Margin',
                          subtitle: 'Avg 32.8% yield',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'KES 42,150',
                                style: GoogleFonts.orbitron(
                                  color: kGreenAccent,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [20.0, 35.0, 28.0, 45.0, 40.0, 52.0]
                                    .map(
                                      (val) => Container(
                                        width: 8,
                                        height: val * 0.7,
                                        decoration: BoxDecoration(
                                          color: kGreenAccent.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              Text(
                                '+4.2% from last week',
                                style: GoogleFonts.inter(
                                  color: kMutedText,
                                  fontSize: 8.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // ── Stock Movement Audit Log Section ────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _sectionHeader('Recent Stock Movements'),
                        Text(
                          'View All',
                          style: GoogleFonts.inter(
                            color: kCherryRed,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _stockLogs.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final log = _stockLogs[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: kCardSurface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: kBorderSubtle),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: (log['color'] as Color)
                                          .withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Icon(
                                      log['type'] == 'Stock In'
                                          ? Icons.add_circle_outline
                                          : Icons.remove_circle_outline,
                                      color: log['color'],
                                      size: 17,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        log['item'],
                                        style: GoogleFonts.inter(
                                          color: kOffWhiteText,
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '${log['type']} • By ${log['user']} • ${log['time']}',
                                        style: GoogleFonts.inter(
                                          color: kMutedText,
                                          fontSize: 9.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                log['qty'],
                                style: GoogleFonts.inter(
                                  color: log['color'],
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 28),

                    // ── Search & Actions Bar ────────────────────────────
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: kOffWhiteText,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search SKU, product, or shelf...',
                              hintStyle: GoogleFonts.inter(
                                color: kMutedText,
                                fontSize: 12,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                size: 18,
                                color: kMutedText,
                              ),
                              filled: true,
                              fillColor: kCardSurface,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: kBorderSubtle),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: kBorderSubtle),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: kOffWhiteText,
                                  width: 1.2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kCherryRed,
                            foregroundColor: kOffWhiteText,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              const Icon(Icons.add,
                                  size: 16, color: kOffWhiteText),
                              const SizedBox(width: 4),
                              Text(
                                'Add',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Category Filter Chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            ['All', 'Beverages', 'Bakery', 'Snacks', 'Pantry']
                                .map((category) => Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: ChoiceChip(
                                        label: Text(
                                          category,
                                          style: GoogleFonts.inter(
                                            fontSize: 10.5,
                                            fontWeight:
                                                _selectedCategory == category
                                                    ? FontWeight.w700
                                                    : FontWeight.w500,
                                            color:
                                                _selectedCategory == category
                                                    ? kOffWhiteText
                                                    : kMutedText,
                                          ),
                                        ),
                                        selected: _selectedCategory == category,
                                        selectedColor: kCherryRed,
                                        backgroundColor: kCardSurface,
                                        shadowColor: Colors.transparent,
                                        side: const BorderSide(color: kBorderSubtle),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        onSelected: (selected) {
                                          if (selected) {
                                            setState(() {
                                              _selectedCategory = category;
                                            });
                                          }
                                        },
                                      ),
                                    ))
                                .toList(),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── Inventory Catalog ───────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _sectionHeader('Inventory Catalog'),
                        Text(
                          '${_sampleProducts.length} Products',
                          style: GoogleFonts.inter(
                            color: kMutedText,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _sampleProducts.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final item = _sampleProducts[index];
                        final double stockRatio =
                            (item['stock'] as int) / (item['stockCap'] as int);

                        return Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: kCardSurface,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: kBorderSubtle),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: kBlackBase,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: kBorderSubtle),
                                    ),
                                    child: const Icon(
                                      Icons.inventory_2_outlined,
                                      color: kOffWhiteText,
                                      size: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['name'],
                                          style: GoogleFonts.inter(
                                            color: kOffWhiteText,
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          '${item['sku']} • ${item['category']} • ${item['location']}',
                                          style: GoogleFonts.inter(
                                            color: kMutedText,
                                            fontSize: 9.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: (item['statusColor'] as Color)
                                          .withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      item['status'],
                                      style: GoogleFonts.inter(
                                        color: item['statusColor'],
                                        fontSize: 9.5,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              // Visual Stock Level Bar
                              Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: SizedBox(
                                        height: 6,
                                        child: Stack(
                                          children: [
                                            Container(color: kBorderSubtle),
                                            FractionallySizedBox(
                                              widthFactor: stockRatio.clamp(
                                                  0.0, 1.0),
                                              child: Container(
                                                color: item['statusColor'],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${item['stock']} / ${item['stockCap']} units',
                                    style: GoogleFonts.inter(
                                      color: kOffWhiteText,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Reorder point: ${item['reorderPoint']} units',
                                  style: GoogleFonts.inter(
                                    color: kMutedText,
                                    fontSize: 9,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),
                              const Divider(height: 1, color: kBorderSubtle),
                              const SizedBox(height: 10),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Vendor: ${item['supplier']}',
                                    style: GoogleFonts.inter(
                                      color: kMutedText,
                                      fontSize: 9.5,
                                    ),
                                  ),
                                  Text(
                                    'Margin: ${item['margin']}',
                                    style: GoogleFonts.inter(
                                      color: kGreenAccent,
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Helper UI Components ──────────────────────────────────────────────────

  Widget _headerIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: kCardSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kBorderSubtle),
      ),
      child: IconButton(
        icon: Icon(icon, color: kOffWhiteText, size: 20),
        onPressed: onTap,
        constraints: const BoxConstraints(minWidth: 38, minHeight: 38),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.orbitron(
        color: kOffWhiteText,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _headerStatChip({
    required IconData icon,
    required String label,
    required String sub,
    Color accent = kOffWhiteText,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: kCardSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorderSubtle),
      ),
      child: Row(
        children: [
          Icon(icon, color: accent, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: GoogleFonts.orbitron(
                    color: kOffWhiteText,
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  sub,
                  style: GoogleFonts.inter(
                    color: kMutedText,
                    fontSize: 9.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionShortcut({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: kCardSurface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: kBorderSubtle),
            ),
            child: Icon(icon, color: kOffWhiteText, size: 22),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: GoogleFonts.inter(
              color: kOffWhiteText,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chartContainer({
    required String title,
    required String subtitle,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kCardSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kBorderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: kOffWhiteText,
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              color: kMutedText,
              fontSize: 9,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _categoryDistributionRow(String name, double ratio, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: GoogleFonts.inter(
                color: kOffWhiteText,
                fontSize: 9.5,
              ),
            ),
            Text(
              '${(ratio * 100).toInt()}%',
              style: GoogleFonts.inter(
                color: kMutedText,
                fontSize: 9.5,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: ratio,
            minHeight: 4,
            backgroundColor: kBorderSubtle,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}