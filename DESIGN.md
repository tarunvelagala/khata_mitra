---
version: alpha
name: KhataPro
description: A clean, trustworthy design system for small business bookkeeping. Semantic financial colors (green=income, red=expense) over a neutral Material 3 surface system.
colors:
  primary: "#1565C0"
  on-primary: "#FFFFFF"
  primary-container: "#D6E3FF"
  on-primary-container: "#001B3D"
  primary-fixed: "#D6E3FF"
  primary-fixed-dim: "#A9C7FF"
  on-primary-fixed: "#001B3D"
  on-primary-fixed-variant: "#00468C"
  inverse-primary: "#A9C7FF"
  surface-tint: "#1565C0"
  secondary: "#2E7D32"
  on-secondary: "#FFFFFF"
  secondary-container: "#A3F69C"
  on-secondary-container: "#002204"
  secondary-fixed: "#A3F69C"
  secondary-fixed-dim: "#88D982"
  on-secondary-fixed: "#002204"
  on-secondary-fixed-variant: "#005312"
  tertiary: "#C62828"
  on-tertiary: "#FFFFFF"
  tertiary-container: "#FFDAD6"
  on-tertiary-container: "#410003"
  tertiary-fixed: "#FFDAD6"
  tertiary-fixed-dim: "#FFB4AC"
  on-tertiary-fixed: "#410003"
  on-tertiary-fixed-variant: "#93000E"
  error: "#BA1A1A"
  on-error: "#FFFFFF"
  error-container: "#FFDAD6"
  on-error-container: "#410002"
  surface: "#FAF9FD"
  surface-dim: "#DAD9DD"
  surface-bright: "#FAF9FD"
  surface-container-lowest: "#FFFFFF"
  surface-container-low: "#F4F3F7"
  surface-container: "#EFEDF1"
  surface-container-high: "#E9E7EC"
  surface-container-highest: "#E3E2E6"
  on-surface: "#1A1B1E"
  on-surface-variant: "#44474E"
  inverse-surface: "#2F3033"
  inverse-on-surface: "#F1F0F4"
  surface-variant: "#E0E2EC"
  outline: "#74777F"
  outline-variant: "#C4C6CF"
  background: "#FAF9FD"
  on-background: "#1A1B1E"
typography:
  display-lg:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 57px
    fontWeight: "400"
    lineHeight: 64px
    letterSpacing: -0.25px
  display-md:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 45px
    fontWeight: "400"
    lineHeight: 52px
  display-sm:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 36px
    fontWeight: "400"
    lineHeight: 44px
  headline-lg:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 32px
    fontWeight: "800"
    lineHeight: 40px
    letterSpacing: -0.5px
  headline-md:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 28px
    fontWeight: "700"
    lineHeight: 36px
    letterSpacing: -0.25px
  headline-sm:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 24px
    fontWeight: "700"
    lineHeight: 32px
  title-lg:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 22px
    fontWeight: "700"
    lineHeight: 28px
  title-md:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 16px
    fontWeight: "600"
    lineHeight: 24px
    letterSpacing: 0.15px
  title-sm:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 14px
    fontWeight: "600"
    lineHeight: 20px
    letterSpacing: 0.1px
  body-lg:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 16px
    fontWeight: "400"
    lineHeight: 24px
    letterSpacing: 0.5px
  body-md:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 14px
    fontWeight: "400"
    lineHeight: 20px
    letterSpacing: 0.25px
  body-sm:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 12px
    fontWeight: "400"
    lineHeight: 16px
    letterSpacing: 0.4px
  label-lg:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 14px
    fontWeight: "600"
    lineHeight: 20px
    letterSpacing: 0.1px
  label-md:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 12px
    fontWeight: "500"
    lineHeight: 16px
    letterSpacing: 0.5px
  label-sm:
    fontFamily: .AppleSystemUIFont, Roboto
    fontSize: 11px
    fontWeight: "700"
    lineHeight: 16px
    letterSpacing: 1px
rounded:
  sm: 12px
  md: 16px
  full: 9999px
spacing:
  base: 8px
  xs: 4px
  sm: 12px
  md: 16px
  lg: 24px
  xl: 32px
  button-padding-v: 20px
  button-padding-h: 24px
  input-padding-v: 20px
  input-padding-h: 16px
  screen-margin: 24px
  section-gap: 32px
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.label-lg}"
    rounded: "{rounded.sm}"
    height: 48px
    padding: 20px 24px
  button-secondary:
    backgroundColor: transparent
    textColor: "{colors.primary}"
    typography: "{typography.label-lg}"
    rounded: "{rounded.sm}"
    height: 48px
    padding: 20px 24px
  button-tertiary:
    backgroundColor: transparent
    textColor: "{colors.primary}"
    typography: "{typography.label-lg}"
    height: 48px
  card-default:
    backgroundColor: "{colors.surface-container-lowest}"
    rounded: "{rounded.sm}"
  card-selected:
    backgroundColor: "{colors.surface-container-lowest}"
    rounded: "{rounded.sm}"
  card-icon-container:
    backgroundColor: "{colors.primary}"
    rounded: "{rounded.md}"
    padding: 16px
    # backgroundColor is applied at 8% opacity at runtime (e.g. primary.withOpacity(0.08))
  input-field:
    backgroundColor: "{colors.surface-container-high}"
    textColor: "{colors.on-surface}"
    typography: "{typography.body-lg}"
    rounded: "{rounded.sm}"
    padding: 20px 16px
  step-indicator-active:
    backgroundColor: "{colors.primary}"
    rounded: "{rounded.full}"
    size: 8px
  step-indicator-inactive:
    backgroundColor: "{colors.outline-variant}"
    rounded: "{rounded.full}"
    size: 8px
  badge-status:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.label-sm}"
    rounded: "{rounded.full}"
  income-indicator:
    backgroundColor: "{colors.secondary-container}"
    textColor: "{colors.on-secondary-container}"
    rounded: "{rounded.sm}"
  expense-indicator:
    backgroundColor: "{colors.tertiary-container}"
    textColor: "{colors.on-tertiary-container}"
    rounded: "{rounded.sm}"
---

# KhataPro Design System

**Stitch Project:** [3823020204310937544](https://stitch.withgoogle.com/project/3823020204310937544)

## Overview

KhataPro is a cross-platform (iOS + Android) digital bookkeeping app ("khata" = ledger in Hindi/Urdu) designed for small business owners across South Asia. The design system is **clean, trustworthy, and utilitarian** — built to instill confidence in users managing their finances, many of whom may be transitioning from paper ledgers to a digital tool for the first time.

The atmosphere is **airy and bright** in light mode, with generous whitespace and soft neutral surfaces that let the content breathe. In dark mode, the mood shifts to **deep ink-dark zinc tones** that feel modern and restful for evening use. The overall aesthetic is **professional without being corporate** — approachable enough for first-time digital users while maintaining the credibility expected of a financial tool.

The design philosophy follows **Material Design 3** as its foundation, using its tonal surface system for layered depth and semantic color roles for clarity. On iOS, the same color palette, typography scale, and spacing tokens apply — but platform-adaptive widgets (Cupertino navigation bars, swipe-to-dismiss, iOS-style date pickers) should be used where Flutter provides them, so the app feels native on both platforms. There is no visual noise — every element earns its place.

## Colors

The palette is built around three semantically distinct hues that map directly to financial concepts. This mapping is the most critical design decision in KhataPro — it must be preserved across all screens.

- **Primary — Dependable Ledger Blue (#1565C0):** The brand's anchor color. A vivid mid-tone blue that conveys trust, stability, and professionalism. Used for CTAs, active states, navigation, and brand identity. It is the neutral "workspace" color — neither income nor expense.
- **Secondary — Prosperous Ledger Green (#2E7D32):** Semantically mapped to **income and credit**. Every green element signals money coming in. A confident forest green that feels positive without being flashy.
- **Tertiary — Alert Ledger Red (#C62828):** Semantically mapped to **expenses and debit**. Every red element signals money going out. A bold, unmistakable red that clearly signals cost without being confused with system errors.
- **Error — Signal Red (#BA1A1A):** Reserved strictly for validation errors, system failures, and destructive actions — never for financial data. Visually distinct from the tertiary expense red.
- **Neutral Surfaces (#FAF9FD → #FFFFFF):** An M3-derived tonal surface system with a subtle blue tint from the primary seed. Provides layered depth without competing with the semantic financial colors. The background carries a barely-perceptible cool cast; cards sit on pure white.
- **Outline (#74777F):** Cool Gray borders and dividers provide structure without drawing attention.

### Dark Mode

Dark mode uses M3-derived dark surfaces (`#121316` / `#1A1B1E`) with lightened versions of all semantic colors: Soft Sky Blue (`#A9C7FF`) for primary, Mint Leaf (`#88D982`) for income, and Salmon Blush (`#FFB4AC`) for expenses. All M3 tonal relationships are preserved.

## Typography

The design system uses the **platform system font** — SF Pro on iOS and Roboto on Android. This eliminates the network dependency of custom web fonts, reduces app bundle size, and ensures the app feels native on each platform. In Flutter, this means no `fontFamily` is set on `TextStyle` — the framework resolves the correct font per platform automatically.

Both SF Pro and Roboto support the full weight range (400–800) and have excellent legibility at all sizes, making them well-suited for a financial app where every digit matters.

- **Display:** Regular weight (400) at large sizes (36–57px) for visual impact through scale rather than boldness. Tight letter-spacing (-0.25px) keeps large text from feeling loose.
- **Headlines:** Bold to extra-bold weights (700–800) with tight letter-spacing (-0.50px to -0.25px) for density and authority.
- **Body:** Regular weight (400) with relaxed letter-spacing (+0.25px to +0.50px) for comfortable reading of descriptions and financial data.
- **Labels:** Medium to bold weights (500–700) with wide tracking (+0.50px to +1.00px) for small-size legibility on buttons, chips, and metadata.

## Layout

The layout follows a **fluid single-column model** optimized for mobile-first handheld use. Elements are generously spaced to ensure the interface never feels cramped — critical for users who may be new to digital tools.

- **Rhythm:** A strict 4px/8px baseline grid governs all dimensions. Every spacing value is a multiple of 4.
- **Screen margins:** 24px horizontal padding on each side. 32px top padding below the safe area.
- **Safe areas:** All screens must respect platform safe area insets — the iOS notch/Dynamic Island at the top and the home indicator bar at the bottom. Use `SafeArea` or `MediaQuery.viewPaddingOf` to ensure content never underlaps hardware obstructions.
- **Grouping:** Selection grids use 2-column layouts with 12–16px cross-axis spacing.
- **Composition:** Every screen follows a consistent vertical rhythm: icon container → step indicator → headline → subtitle → scrollable content → sticky CTA bar.
- **CTA Bar:** A gradient fade from transparent to solid surface (12px top, 24px bottom padding) anchors the primary action at the bottom of each screen.

## Elevation & Depth

The design is intentionally **flat**. Cards, buttons, and the app bar all sit at elevation 0. Depth is communicated through Material 3's **tonal surface layering** rather than shadows:

- **Surface hierarchy:** Background (`#FAF9FD`) → Surface Container Low (`#F4F3F7`) → Surface Container (`#EFEDF1`) → Surface Container High (`#E9E7EC`). Each step is a subtle tonal shift, not a shadow.
- **Border contrast:** Selected cards gain a 2px primary-color border; unselected cards have a 1px `outline-variant` border.
- **Whisper-soft shadows:** Applied only to interactive selection cards when selected — rgba black at 4–6% opacity, 8–12px blur, 2px y-offset. These are the only shadows in the entire system.
- **App bar:** Uses background color at 80% opacity for a frosted-glass effect, with zero elevation and no shadow.

This flatness reinforces the utilitarian, trustworthy aesthetic — nothing floats, nothing looms, everything feels grounded and reliable.

## Shapes

The shape language is **subtly rounded** — soft enough to feel modern and approachable, sharp enough to maintain a professional, structured feel.

- **Cards, buttons, inputs:** 12px corner radius (`rounded-sm`). Just enough softness to feel contemporary without being playful.
- **Icon containers:** 16px corner radius (`rounded-md`). Slightly more rounded to visually distinguish decorative elements from interactive ones.
- **Badges, chips, step indicators:** Fully pill-shaped (`9999px` / `rounded-full`). Used for small status elements and progress dots.
- **No mixed radii within a single component.** All corners of a given element use the same radius.

## Components

### Buttons

Primary buttons are flat (zero elevation) with a solid Ledger Blue (`#1565C0`) background and white text. Secondary (outlined) buttons use a 1px `outline` border with primary-colored text on a transparent background. Tertiary (text) buttons have no background or border. All buttons share 12px corner radius and generous 20px × 24px padding for confident tap targets. Transitions use 200ms duration.

### Cards

Default cards use a pure white (`#FFFFFF`) background with 12px corners and zero elevation. Interactive selection cards animate between states over 200ms: selected cards gain a 2px primary border and a whisper-soft shadow; unselected cards show a 1px `outline-variant` border. Icon containers use `primary` color at 8% opacity (`primary.withOpacity(0.08)`) as background, with a 40px icon in full `primary` color inside.

### Inputs

Text fields use a filled style with `surface-container-high` (`#E9E7EC`) background and 12px corners. No visible border in default state; a 2px primary-color border appears on focus. Content padding is 20px vertical × 16px horizontal. Prefix icons render in muted `on-surface-variant` gray.

### Financial Indicators

Income/credit elements use the secondary green palette: `secondary-container` (`#A3F69C`) background with `on-secondary-container` text. Expense/debit elements use the tertiary red palette: `tertiary-container` (`#FFDAD6`) background with `on-tertiary-container` text. These must never be mixed or swapped.

### Step Indicator

Progress dots are 8px pill-shaped circles. Active step uses primary color; inactive steps use `outline-variant`. The indicator sits between the icon container and the headline.

### Lists & Dividers

Dividers use 1px lines in `outline-variant` (`#C4C6CF`) — nearly invisible, present for structure rather than decoration. List items and permission cards use subtle borders with 12px radius.

## Platform Adaptation

KhataPro ships on both iOS and Android. The design tokens (colors, typography scale, spacing, rounded corners) are **shared across platforms**. What adapts is the widget behavior and interaction patterns so the app feels native on each OS.

### What stays the same (both platforms)
- All color tokens, tonal surfaces, and semantic financial colors
- Typography scale (sizes, weights, letter-spacing) — only the resolved font changes (SF Pro vs Roboto)
- Spacing, padding, and border radii
- Card layouts, icon containers, step indicators
- The financial color mapping: green = income, red = expense

### What adapts per platform
- **Navigation:** On Android, use Material back buttons and app bars. On iOS, prefer `CupertinoNavigationBar` with leading back chevrons and swipe-to-go-back gestures.
- **Dialogs & Sheets:** Use `showModalBottomSheet` on Android and `CupertinoActionSheet` / `CupertinoAlertDialog` on iOS for confirmations and pickers.
- **Date & Time Pickers:** Use `CupertinoDatePicker` (scroll wheel) on iOS and Material date picker on Android.
- **Switches & Toggles:** Use `CupertinoSwitch` on iOS and Material `Switch` on Android — both styled with the primary color token.
- **Scroll Physics:** Use `BouncingScrollPhysics` on iOS and `ClampingScrollPhysics` on Android (Flutter handles this by default).
- **Safe Areas:** iOS requires additional bottom inset for the home indicator bar. Always wrap screen content with `SafeArea` and account for the notch/Dynamic Island at the top.
- **Haptics:** Use iOS-style light haptic feedback on selection events; use standard vibration on Android.

### Implementation guidance (Flutter)
Use `Platform.isIOS` checks or Flutter's `.adaptive` widget constructors (e.g., `Switch.adaptive`, `Slider.adaptive`) where available. For navigation, `go_router` handles platform-appropriate transitions automatically. The `ThemeData` and color scheme remain identical — only widget selection branches by platform.

## Accessibility

### Contrast Ratios

All color pairings must meet **WCAG AA** minimums:
- **4.5:1** for body text (body-sm through body-lg, label-sm through label-lg)
- **3:1** for large text (headline-sm and above, 24px+) and UI components (borders, icons)

Key pairings to validate:
- `on-surface` (`#1A1B1E`) on `surface` (`#FAF9FD`) — primary text
- `on-primary` (`#FFFFFF`) on `primary` (`#1565C0`) — button text
- `on-secondary-container` (`#002204`) on `secondary-container` (`#A3F69C`) — income indicators
- `on-tertiary-container` (`#410003`) on `tertiary-container` (`#FFDAD6`) — expense indicators
- Dark mode equivalents must also be validated independently

### Touch Targets

All interactive elements must meet minimum touch target sizes:
- **48 x 48dp** on Android (Material guideline)
- **44 x 44pt** on iOS (Apple HIG)

Buttons enforce a 48px minimum height via the component token. For smaller interactive elements (chips, step indicator dots, list item trailing icons), ensure the tappable area meets the minimum even if the visual element is smaller — use transparent padding to extend the hit area.

### Color-Blind Safety

The green (income) / red (expense) distinction is critical for the app's core function. Approximately 8% of males have red-green color vision deficiency. To ensure accessibility:

- **Never rely on color alone** to convey financial meaning. All income indicators must include a "+" prefix or upward arrow icon. All expense indicators must include a "−" prefix or downward arrow icon.
- **Text labels** ("Income", "Expense", "Credit", "Debit") are mandatory alongside colored indicators.
- **Container contrast:** Income uses a light green container (`#A3F69C`) with near-black text; expense uses a light pink container (`#FFDAD6`) with near-black text. The lightness difference between these containers (green is darker, pink is lighter) provides a secondary signal beyond hue.

### Focus Indicators

For keyboard navigation and screen reader users, focused interactive elements display a **2px solid outline** in `primary` color with a **2px offset** from the element edge. The focus ring must have at least 3:1 contrast against the surrounding background. In Flutter, use `MaterialStateProperty` or `FocusNode` to apply focus styles consistently.

### Reduced Motion

All 200ms transitions (card selection, theme switching) must be disabled when the user has enabled **Reduce Motion** in system settings. In Flutter, check `MediaQuery.disableAnimationsOf(context)` and set animation duration to `Duration.zero`. Transitions are visual polish, never a requirement for interaction feedback — the UI must be fully functional without them.

## Iconography

Icons use the **Material Symbols Outlined** style with a consistent visual language:

- **Size scale:** 16px (inline label icons), 24px (list item / toolbar icons), 32px (action icons), 40px (card hero icons in icon containers)
- **Style:** Outlined (stroke-based), 2px optical stroke weight. Use filled variants only inside hero icon containers and for high-emphasis active states.
- **Color:** Default to `on-surface-variant` (`#44474E` light / `#C4C6CF` dark). Use `primary` for active/selected states. Use `secondary` (green) or `tertiary` (red) only for financial indicator icons.
- **Alignment:** Icons in buttons and list items are vertically centered with adjacent text. Ensure icon optical center aligns with the text x-height, not the bounding box.

## State Patterns

### Loading States

**Splash Screen — "Opening the Ledger"** (total ~1.4s, 4 phases):

1. **Book appears (0–400ms):** The rounded rectangle fades in and scales from 0.85 → 1.0 with ease-out. Just the blank page — no lines yet. Background matches `surface` (light) or dark surface (dark).
2. **Binding draws down (400–800ms):** The two vertical lines (green income, red expense) draw top-to-bottom simultaneously via `strokeEnd` 0 → 1. Green leads by ~50ms, then red follows — a subtle stagger hinting "income first, then expenses."
3. **Entries write in (800–1200ms):** The three horizontal blue lines draw left-to-right, staggered 80ms apart (top → middle → bottom), like writing ledger entries. Each uses `strokeEnd` 0 → 1 with ease-out.
4. **Settle + hold (1200–1400ms):** A barely perceptible scale pulse (1.0 → 1.02 → 1.0) on the entire icon, then hold ~200ms before transitioning to the app.

**Reduced motion fallback:** Skip all draws; show the complete icon at 100% opacity with a single 300ms fade-in.

**Skeleton screens:**

Use a shimmer placeholder that pulses a 10% opacity white sweep over `surface-container` backgrounds. Animation: 800ms duration, ease-in-out, infinite loop. Shimmer shapes should mirror the layout of the content being loaded (card-shaped for cards, line-shaped for text). Respect reduced motion — replace shimmer with a static `surface-container-high` fill when animations are disabled.

### Empty States

When a screen has no data (e.g., no transactions, no customers), display:
1. A 64px outlined icon in `outline-variant` color, centered
2. A headline-sm title in `on-surface` (e.g., "No transactions yet")
3. A body-md description in `on-surface-variant` (e.g., "Your ledger entries will appear here")
4. A primary CTA button if the user can take action (e.g., "Add first entry")

Use 32px+ vertical spacing above the icon and between each element.

### Error States

- **Form validation:** `error` color (`#BA1A1A`) for input field borders and helper text. Never use `tertiary` (expense red) for form errors.
- **System errors:** Display in a card with `error-container` (`#FFDAD6`) background and `on-error-container` (`#410002`) text, with an error icon.
- **Network/connectivity:** Use a banner at the top of the screen with `error-container` background and a retry action.
- **Financial errors** (e.g., "insufficient balance"): Use `tertiary-container` with `on-tertiary-container` to semantically tie them to expense/debit rather than system failure.

## Internationalization

### Supported Languages

KhataPro supports 8 languages: English, Hindi, Kannada, Tamil, Bengali, Marathi, Malayalam, and Telugu. All UI strings are externalized to ARB localization files.

### Text Expansion

Hindi and Marathi text is typically 15–25% longer than English equivalents. Tamil and Malayalam can be 20–30% longer. All layouts must accommodate this expansion without breaking:

- **Headlines:** Clamp to 2 lines maximum with trailing ellipsis. Never allow headlines to push content below the fold.
- **Body text:** Allow natural wrapping. Set `maxLines` only where layout integrity requires it (list items: 2 lines; card subtitles: 1 line).
- **Buttons:** Use flexible width (not fixed). Button text should never truncate — if a translation is too long, the button stretches horizontally up to `screen-width - 2 × screen-margin`.
- **Financial amounts:** Use `tabularFigures` font feature for digit alignment. Amounts never truncate — they wrap to the next line if needed.

### Script Considerations

All 8 supported scripts are LTR (left-to-right). If Urdu (RTL) support is added in the future, all margin/padding must use logical properties (`start`/`end` instead of `left`/`right`), and directional icons (back arrows, progress indicators) must flip. The current layout uses `EdgeInsets.symmetric` and `CrossAxisAlignment.center`, which are direction-agnostic by default.

## Do's and Don'ts

- Do use green (secondary) exclusively for income/credit and red (tertiary) exclusively for expense/debit — never swap or mix these meanings
- Do maintain the distinction between tertiary red (financial expenses, `#C62828`) and error red (system errors, `#BA1A1A`) — they serve different purposes
- Do always pair financial color indicators with a text label and a directional icon (+/−, arrow) — never rely on color alone
- Do maintain WCAG AA contrast ratios: 4.5:1 for body text, 3:1 for large text and UI components
- Do ensure all touch targets are at least 48 x 48dp (Android) / 44 x 44pt (iOS)
- Do keep all surfaces flat (elevation 0) and use tonal layering for depth instead of shadows
- Do use the platform system font throughout — SF Pro on iOS, Roboto on Android, no custom fonts
- Do use platform-adaptive widgets (Cupertino navigation bars, date pickers, switches) on iOS to feel native
- Do wrap all screen content in `SafeArea` to handle iOS notch, Dynamic Island, and home indicator
- Do respect reduced motion preferences — disable all transitions when `MediaQuery.disableAnimationsOf` is true
- Do test all screens with Hindi text (15–25% longer than English) to validate layout resilience
- Don't use primary blue for financial indicators — blue is the neutral workspace color, not a financial signal
- Don't add decorative shadows or gradients — the only shadows permitted are the whisper-soft ones on selected interactive cards
- Don't use border radii other than 12px (sm), 16px (md), or 9999px (full) — the shape system has exactly three levels
- Don't crowd the layout — maintain 24px screen margins and generous vertical spacing to keep the interface approachable for first-time digital users
- Don't force Material-only widgets on iOS (e.g., Material date picker, Android-style back arrow) — use `.adaptive` constructors or platform checks
- Don't truncate financial amounts — numbers must always be fully visible, wrapping to the next line if needed
