<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Professional Website Design & Development | Teez2Print Web Solutions</title>
    <meta name="description" content="High-converting websites starting at $100. Fast, secure, zero hosting fees. Perfect for businesses, portfolios, and startups.">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        * {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            background: linear-gradient(135deg, #090D16 0%, #0f172a 50%, #0d1b2a 100%);
            color: #e5e7eb;
            overflow-x: hidden;
        }

        /* Glassmorphism Effect */
        .glass {
            background: rgba(15, 23, 42, 0.6);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(99, 102, 241, 0.2);
            border-radius: 1rem;
        }

        .glass-hover:hover {
            background: rgba(15, 23, 42, 0.8);
            border-color: rgba(99, 102, 241, 0.4);
            transition: all 0.3s ease;
        }

        /* Gradient Text */
        .gradient-text {
            background: linear-gradient(135deg, #6366F1 0%, #10B981 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Neon Glow Effects */
        .neon-glow {
            text-shadow: 0 0 20px rgba(99, 102, 241, 0.6), 0 0 40px rgba(16, 185, 129, 0.3);
        }

        .glow-card {
            box-shadow: 0 0 30px rgba(99, 102, 241, 0.2), inset 0 1px 1px rgba(255, 255, 255, 0.1);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .glow-card:hover {
            box-shadow: 0 0 50px rgba(99, 102, 241, 0.4), 0 20px 40px rgba(99, 102, 241, 0.15), inset 0 1px 1px rgba(255, 255, 255, 0.1);
            transform: translateY(-8px);
        }

        /* CTA Button Glow */
        .btn-glow {
            background: linear-gradient(135deg, #10B981 0%, #059669 100%);
            box-shadow: 0 0 20px rgba(16, 185, 129, 0.4);
            transition: all 0.3s ease;
        }

        .btn-glow:hover {
            box-shadow: 0 0 40px rgba(16, 185, 129, 0.6), 0 10px 30px rgba(16, 185, 129, 0.2);
            transform: translateY(-2px);
        }

        /* Pricing Card Highlight */
        .pricing-highlighted {
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.15) 0%, rgba(16, 185, 129, 0.08) 100%);
            border: 2px solid rgba(16, 185, 129, 0.4);
        }

        /* Accordion Animation */
        .accordion-content {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease-out;
        }

        .accordion-content.active {
            max-height: 500px;
        }

        /* Smooth Fade In */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .fade-in {
            animation: fadeIn 0.6s ease-out;
        }

        /* Icon Styling */
        .icon-box {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 50px;
            height: 50px;
            border-radius: 0.75rem;
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.2), rgba(16, 185, 129, 0.1));
        }

        /* Mobile Menu Animation */
        .mobile-menu {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease-out;
        }

        .mobile-menu.active {
            max-height: 400px;
        }

        /* Checkmark Style */
        .checkmark {
            color: #10B981;
            font-weight: 600;
            margin-right: 8px;
        }

        /* Portfolio Grid */
        .portfolio-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
            padding: 0;
        }

        @media (max-width: 768px) {
            .portfolio-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Floating CTA */
        .floating-cta {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 40;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                box-shadow: 0 0 20px rgba(16, 185, 129, 0.4);
            }
            50% {
                box-shadow: 0 0 40px rgba(16, 185, 129, 0.6);
            }
        }

        @media (max-width: 640px) {
            .floating-cta {
                bottom: 20px;
                right: 20px;
            }
        }

        /* Input Styling */
        input, textarea, select {
            background: rgba(30, 41, 59, 0.8) !important;
            border: 1px solid rgba(99, 102, 241, 0.2) !important;
            color: #e5e7eb !important;
            transition: all 0.3s ease !important;
        }

        input:focus, textarea:focus, select:focus {
            background: rgba(30, 41, 59, 1) !important;
            border-color: rgba(99, 102, 241, 0.6) !important;
            outline: none !important;
            box-shadow: 0 0 20px rgba(99, 102, 241, 0.2) !important;
        }

        input::placeholder, textarea::placeholder {
            color: #9ca3af;
        }

        /* Pricing Toggle */
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 30px;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(99, 102, 241, 0.3);
            transition: 0.4s;
            border-radius: 30px;
            border: 1px solid rgba(99, 102, 241, 0.4);
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 22px;
            width: 22px;
            left: 4px;
            bottom: 3px;
            background-color: white;
            transition: 0.4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: #10B981;
        }

        input:checked + .slider:before {
            transform: translateX(30px);
        }

        /* Responsive Typography */
        @media (max-width: 640px) {
            h1 {
                font-size: 1.875rem !important;
            }
            h2 {
                font-size: 1.5rem !important;
            }
        }
    </style>
</head>
<body class="bg-gradient-to-b from-slate-950 to-slate-900 text-gray-100">
    <!-- Navigation -->
    <nav class="fixed w-full top-0 z-50 glass border-b border-indigo-500/20">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-16">
                <!-- Logo -->
                <div class="flex items-center gap-2 group cursor-pointer">
                    <div class="w-10 h-10 bg-gradient-to-br from-indigo-500 to-emerald-500 rounded-lg flex items-center justify-center font-bold text-white">
                        T2P
                    </div>
                    <span class="text-xl font-bold gradient-text hidden sm:inline">Teez2Print</span>
                </div>

                <!-- Desktop Menu -->
                <div class="hidden md:flex gap-8">
                    <a href="#why-us" class="text-gray-300 hover:text-indigo-400 transition">Why Us</a>
                    <a href="#pricing" class="text-gray-300 hover:text-indigo-400 transition">Pricing</a>
                    <a href="#portfolio" class="text-gray-300 hover:text-indigo-400 transition">Portfolio</a>
                    <a href="#faq" class="text-gray-300 hover:text-indigo-400 transition">FAQ</a>
                    <a href="#contact" class="text-gray-300 hover:text-indigo-400 transition">Contact</a>
                </div>

                <!-- Mobile Menu Button -->
                <button id="mobile-menu-btn" class="md:hidden text-indigo-400 hover:text-indigo-300 focus:outline-none transition" aria-label="Toggle menu">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                    </svg>
                </button>
            </div>

            <!-- Mobile Menu -->
            <div id="mobile-menu" class="mobile-menu md:hidden bg-slate-900/80 rounded-lg mt-2 p-4 space-y-3">
                <a href="#why-us" class="block text-gray-300 hover:text-indigo-400 transition py-2">Why Us</a>
                <a href="#pricing" class="block text-gray-300 hover:text-indigo-400 transition py-2">Pricing</a>
                <a href="#portfolio" class="block text-gray-300 hover:text-indigo-400 transition py-2">Portfolio</a>
                <a href="#faq" class="block text-gray-300 hover:text-indigo-400 transition py-2">FAQ</a>
                <a href="#contact" class="block text-gray-300 hover:text-indigo-400 transition py-2">Contact</a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="hero" class="min-h-screen flex items-center justify-center pt-20 pb-20 px-4">
        <div class="max-w-4xl mx-auto text-center">
            <!-- Trust Badges -->
            <div class="mb-8 flex flex-wrap justify-center gap-4">
                <div class="inline-flex items-center gap-2 glass px-4 py-2 rounded-full text-sm">
                    <span class="text-emerald-400">⚡</span>
                    <span>Lightning Fast</span>
                </div>
                <div class="inline-flex items-center gap-2 glass px-4 py-2 rounded-full text-sm">
                    <span class="text-indigo-400">🔒</span>
                    <span>Bank-Level Security</span>
                </div>
                <div class="inline-flex items-center gap-2 glass px-4 py-2 rounded-full text-sm">
                    <span class="text-emerald-400">💰</span>
                    <span>Zero Monthly Fees</span>
                </div>
            </div>

            <!-- Main Headline -->
            <h1 class="text-5xl md:text-7xl font-black mb-6 gradient-text fade-in leading-tight">
                Professional Websites<br>at Unbeatable Prices
            </h1>

            <!-- Subheadline -->
            <p class="text-xl md:text-2xl text-gray-300 mb-8 max-w-2xl mx-auto fade-in" style="animation-delay: 0.1s;">
                Lightning-fast, secure, stunning websites built and deployed in days, not months. Starting at just <span class="text-emerald-400 font-bold">$100</span>. Zero hosting fees. Zero technical debt.
            </p>

            <!-- CTA Buttons -->
            <div class="flex flex-col sm:flex-row gap-4 justify-center mb-12 fade-in" style="animation-delay: 0.2s;">
                <button onclick="document.getElementById('contact-form').scrollIntoView({ behavior: 'smooth' })" class="btn-glow px-8 py-4 rounded-lg font-bold text-white text-lg transition-all duration-300">
                    Get Started for $100
                </button>
                <button onclick="document.getElementById('pricing').scrollIntoView({ behavior: 'smooth' })" class="px-8 py-4 rounded-lg font-bold border-2 border-indigo-500 text-indigo-300 hover:bg-indigo-500/10 transition-all duration-300">
                    Explore All Packages
                </button>
            </div>

            <!-- Scroll Indicator -->
            <div class="mt-16 animate-bounce">
                <svg class="w-8 h-8 mx-auto text-indigo-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
                </svg>
            </div>
        </div>
    </section>

    <!-- Why Choose Us Section -->
    <section id="why-us" class="py-20 px-4 bg-gradient-to-b from-slate-900 to-slate-950">
        <div class="max-w-6xl mx-auto">
            <div class="text-center mb-16">
                <h2 class="text-4xl md:text-5xl font-bold mb-6">Why Choose Teez2Print?</h2>
                <p class="text-xl text-gray-400 max-w-3xl mx-auto">
                    We deliver enterprise-grade websites at startup prices. No bloated platforms. No monthly hosting fees. Just pure, optimized code deployed on GitHub Pages.
                </p>
            </div>

            <!-- Features Grid -->
            <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
                <!-- Feature 1 -->
                <div class="glow-card glass p-8 rounded-xl">
                    <div class="icon-box mb-6">
                        <span class="text-2xl">⚡</span>
                    </div>
                    <h3 class="text-xl font-bold mb-3">Blazing Fast</h3>
                    <p class="text-gray-400">Static site deployment means sub-second load times. No database queries. No server lag.</p>
                </div>

                <!-- Feature 2 -->
                <div class="glow-card glass p-8 rounded-xl">
                    <div class="icon-box mb-6">
                        <span class="text-2xl">🔒</span>
                    </div>
                    <h3 class="text-xl font-bold mb-3">Bulletproof Security</h3>
                    <p class="text-gray-400">GitHub's infrastructure + automated SSL. No database vulnerabilities. Zero attack surface.</p>
                </div>

                <!-- Feature 3 -->
                <div class="glow-card glass p-8 rounded-xl">
                    <div class="icon-box mb-6">
                        <span class="text-2xl">💾</span>
                    </div>
                    <h3 class="text-xl font-bold mb-3">Zero Maintenance</h3>
                    <p class="text-gray-400">No server updates. No dependency patches. Pure HTML, CSS, and JS deployed on GitHub.</p>
                </div>

                <!-- Feature 4 -->
                <div class="glow-card glass p-8 rounded-xl">
                    <div class="icon-box mb-6">
                        <span class="text-2xl">💰</span>
                    </div>
                    <h3 class="text-xl font-bold mb-3">Save $100s Yearly</h3>
                    <p class="text-gray-400">No WordPress hosting. No monthly fees. Lifetime free hosting. Your site owns itself.</p>
                </div>
            </div>

            <!-- Comparison Section -->
            <div class="mt-16 glass rounded-xl p-8 border-2 border-indigo-500/30">
                <h3 class="text-2xl font-bold mb-8 text-center">The True Cost of Web Solutions</h3>
                <div class="grid md:grid-cols-3 gap-8">
                    <div>
                        <h4 class="text-lg font-bold text-red-400 mb-4">❌ Traditional WordPress</h4>
                        <ul class="space-y-3 text-gray-400">
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>$15-50/month hosting</span>
                            </li>
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>Slow & bloated</span>
                            </li>
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>Security patches required</span>
                            </li>
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>Build time: weeks</span>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h4 class="text-lg font-bold text-yellow-400 mb-4">⚠️ DIY Builders (Wix, Squarespace)</h4>
                        <ul class="space-y-3 text-gray-400">
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>$12-30/month minimum</span>
                            </li>
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>Limited customization</span>
                            </li>
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>Vendor lock-in</span>
                            </li>
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>Build time: days to weeks</span>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h4 class="text-lg font-bold text-emerald-400 mb-4">✅ Teez2Print (GitHub Pages)</h4>
                        <ul class="space-y-3 text-gray-400">
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>$0/month forever</span>
                            </li>
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>Fully customizable</span>
                            </li>
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>Owns your code</span>
                            </li>
                            <li class="flex items-start gap-2">
                                <span>•</span>
                                <span>Build time: days</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Pricing Section -->
    <section id="pricing" class="py-20 px-4 bg-gradient-to-b from-slate-950 to-slate-900">
        <div class="max-w-6xl mx-auto">
            <div class="text-center mb-16">
                <h2 class="text-4xl md:text-5xl font-bold mb-6">Simple, Transparent Pricing</h2>
                <p class="text-xl text-gray-400 max-w-3xl mx-auto">
                    No hidden fees. No surprise charges. What you see is what you get.
                </p>
            </div>

            <!-- Pricing Cards Grid -->
            <div class="grid md:grid-cols-3 gap-8 mb-16">
                <!-- Tier 1: $100 -->
                <div class="glow-card glass rounded-xl p-8 border-2 border-indigo-500/30 flex flex-col">
                    <div class="mb-6">
                        <h3 class="text-2xl font-bold mb-2">Starter Package</h3>
                        <p class="text-gray-400 text-sm mb-4">Perfect for launching fast</p>
                        <div class="flex items-baseline gap-2">
                            <span class="text-5xl font-bold text-emerald-400">$100</span>
                            <span class="text-gray-400">one-time</span>
                        </div>
                    </div>

                    <div class="mb-8 pb-8 border-b border-indigo-500/20">
                        <p class="text-gray-300 text-sm">Professional website ready for launch</p>
                    </div>

                    <ul class="space-y-4 mb-8 flex-grow">
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Multi-section professional website</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Mobile responsive design</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Performance optimized</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">GitHub Pages deployment</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Free hosting forever</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">SSL/HTTPS included</span>
                        </li>
                    </ul>

                    <button onclick="document.getElementById('contact-form').scrollIntoView({ behavior: 'smooth' })" class="w-full btn-glow text-white font-bold py-3 rounded-lg transition-all">
                        Choose Starter
                    </button>
                </div>

                <!-- Tier 2: $115 - MOST POPULAR -->
                <div class="glow-card pricing-highlighted rounded-xl p-8 border-2 border-emerald-500/50 flex flex-col relative">
                    <div class="absolute -top-4 left-6 bg-gradient-to-r from-indigo-500 to-emerald-500 px-4 py-1 rounded-full text-sm font-bold text-white">
                        BEST VALUE
                    </div>

                    <div class="mb-6">
                        <h3 class="text-2xl font-bold mb-2">Custom Domain Package</h3>
                        <p class="text-gray-400 text-sm mb-4">Most popular for businesses</p>
                        <div class="flex items-baseline gap-2">
                            <span class="text-5xl font-bold text-emerald-400">$115</span>
                            <span class="text-gray-400">one-time</span>
                        </div>
                    </div>

                    <div class="mb-8 pb-8 border-b border-emerald-500/20">
                        <p class="text-gray-300 text-sm">Everything in Starter PLUS branded identity</p>
                    </div>

                    <ul class="space-y-4 mb-8 flex-grow">
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Everything in $100 Package</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Custom domain setup (.com, .net, .org)</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">DNS record management</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Domain mapping & configuration</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Professional email setup guidance</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">SEO optimization included</span>
                        </li>
                    </ul>

                    <button onclick="document.getElementById('contact-form').scrollIntoView({ behavior: 'smooth' })" class="w-full btn-glow text-white font-bold py-3 rounded-lg transition-all">
                        Choose Custom Domain
                    </button>
                </div>

                <!-- Tier 3: $500+ -->
                <div class="glow-card glass rounded-xl p-8 border-2 border-indigo-500/30 flex flex-col">
                    <div class="mb-6">
                        <h3 class="text-2xl font-bold mb-2">Enterprise & Custom Apps</h3>
                        <p class="text-gray-400 text-sm mb-4">For complex requirements</p>
                        <div class="flex items-baseline gap-2">
                            <span class="text-5xl font-bold text-emerald-400">$500+</span>
                            <span class="text-gray-400">custom pricing</span>
                        </div>
                    </div>

                    <div class="mb-8 pb-8 border-b border-indigo-500/20">
                        <p class="text-gray-300 text-sm">Dynamic features, custom logic, advanced integrations</p>
                    </div>

                    <ul class="space-y-4 mb-8 flex-grow">
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Custom web applications</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Dynamic interactive components</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Complex animations & effects</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Database integration</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">Custom API integrations</span>
                        </li>
                        <li class="flex items-start gap-3">
                            <span class="checkmark text-emerald-400">✓</span>
                            <span class="text-gray-300">User authentication & authorization</span>
                        </li>
                    </ul>

                    <button onclick="document.getElementById('contact-form').scrollIntoView({ behavior: 'smooth' })" class="w-full btn-glow text-white font-bold py-3 rounded-lg transition-all">
                        Get Enterprise Quote
                    </button>
                </div>
            </div>
        </div>
    </section>

    <!-- Complex Project Calculator -->
    <section id="calculator" class="py-20 px-4 bg-gradient-to-b from-slate-900 to-slate-950">
        <div class="max-w-4xl mx-auto">
            <div class="text-center mb-16">
                <h2 class="text-4xl md:text-5xl font-bold mb-6">$500+ Project Calculator</h2>
                <p class="text-xl text-gray-400 max-w-3xl mx-auto">
                    Select features to see a transparent cost estimate for your custom project.
                </p>
            </div>

            <div class="glass rounded-xl p-8 border-2 border-indigo-500/30">
                <div class="mb-8">
                    <h3 class="text-2xl font-bold mb-6">Select Your Features</h3>

                    <div class="space-y-4">
                        <!-- Feature 1 -->
                        <label class="flex items-center gap-4 p-4 rounded-lg hover:bg-slate-800/50 cursor-pointer transition">
                            <input type="checkbox" class="feature-checkbox w-5 h-5" data-price="250" value="Advanced Animations">
                            <span class="flex-grow">
                                <span class="font-bold">Advanced Animations & Effects</span>
                                <span class="text-gray-400 text-sm block">+$250</span>
                            </span>
                        </label>

                        <!-- Feature 2 -->
                        <label class="flex items-center gap-4 p-4 rounded-lg hover:bg-slate-800/50 cursor-pointer transition">
                            <input type="checkbox" class="feature-checkbox w-5 h-5" data-price="500" value="E-commerce Setup">
                            <span class="flex-grow">
                                <span class="font-bold">E-commerce Setup (Product Pages, Cart, Checkout)</span>
                                <span class="text-gray-400 text-sm block">+$500</span>
                            </span>
                        </label>

                        <!-- Feature 3 -->
                        <label class="flex items-center gap-4 p-4 rounded-lg hover:bg-slate-800/50 cursor-pointer transition">
                            <input type="checkbox" class="feature-checkbox w-5 h-5" data-price="400" value="User Authentication">
                            <span class="flex-grow">
                                <span class="font-bold">User Authentication & Profiles</span>
                                <span class="text-gray-400 text-sm block">+$400</span>
                            </span>
                        </label>

                        <!-- Feature 4 -->
                        <label class="flex items-center gap-4 p-4 rounded-lg hover:bg-slate-800/50 cursor-pointer transition">
                            <input type="checkbox" class="feature-checkbox w-5 h-5" data-price="300" value="Database Integration">
                            <span class="flex-grow">
                                <span class="font-bold">Database Integration & CMS</span>
                                <span class="text-gray-400 text-sm block">+$300</span>
                            </span>
                        </label>

                        <!-- Feature 5 -->
                        <label class="flex items-center gap-4 p-4 rounded-lg hover:bg-slate-800/50 cursor-pointer transition">
                            <input type="checkbox" class="feature-checkbox w-5 h-5" data-price="350" value="API Integrations">
                            <span class="flex-grow">
                                <span class="font-bold">Custom API Integrations (Stripe, Mailchimp, etc.)</span>
                                <span class="text-gray-400 text-sm block">+$350</span>
                            </span>
                        </label>

                        <!-- Feature 6 -->
                        <label class="flex items-center gap-4 p-4 rounded-lg hover:bg-slate-800/50 cursor-pointer transition">
                            <input type="checkbox" class="feature-checkbox w-5 h-5" data-price="200" value="Advanced Analytics">
                            <span class="flex-grow">
                                <span class="font-bold">Advanced Analytics & Reporting</span>
                                <span class="text-gray-400 text-sm block">+$200</span>
                            </span>
                        </label>

                        <!-- Feature 7 -->
                        <label class="flex items-center gap-4 p-4 rounded-lg hover:bg-slate-800/50 cursor-pointer transition">
                            <input type="checkbox" class="feature-checkbox w-5 h-5" data-price="150" value="Mobile App Version">
                            <span class="flex-grow">
                                <span class="font-bold">Mobile App Version (iOS/Android)</span>
                                <span class="text-gray-400 text-sm block">+$150</span>
                            </span>
                        </label>
                    </div>
                </div>

                <!-- Cost Display -->
                <div class="bg-gradient-to-br from-indigo-600/20 to-emerald-600/10 rounded-lg p-8 border border-emerald-500/30">
                    <div class="text-center">
                        <p class="text-gray-400 mb-2">Estimated Project Cost</p>
                        <div class="text-6xl font-bold gradient-text mb-4">
                            $<span id="calc-price">500</span>
                        </div>
                        <p class="text-gray-400 text-sm">
                            Base price: $500 + selected features
                        </p>
                        <p class="text-gray-500 text-xs mt-4">
                            Final price may vary based on complexity and timeline. Schedule a consultation for accurate quote.
                        </p>
                        <button onclick="document.getElementById('contact-form').scrollIntoView({ behavior: 'smooth' })" class="mt-6 btn-glow px-8 py-3 rounded-lg font-bold text-white transition-all">
                            Get Custom Quote
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Portfolio / Featured Showcase -->
    <section id="portfolio" class="py-20 px-4 bg-gradient-to-b from-slate-950 to-slate-900">
        <div class="max-w-6xl mx-auto">
            <div class="text-center mb-16">
                <h2 class="text-4xl md:text-5xl font-bold mb-6">Featured Work</h2>
                <p class="text-xl text-gray-400 max-w-3xl mx-auto">
                    Beautiful, high-converting websites across industries. All built with speed, security, and simplicity in mind.
                </p>
            </div>

            <div class="portfolio-grid">
                <!-- Portfolio Item 1 -->
                <div class="glow-card glass rounded-xl p-6 border-2 border-indigo-500/30">
                    <h3 class="text-xl font-bold mb-2">Professional Services Agency</h3>
                    <p class="text-gray-400 mb-4">A sleek, modern corporate site showcasing services, team, and case studies.</p>
                    <div class="flex gap-2 flex-wrap">
                        <span class="text-xs bg-indigo-500/20 text-indigo-300 px-3 py-1 rounded-full">Responsive</span>
                        <span class="text-xs bg-emerald-500/20 text-emerald-300 px-3 py-1 rounded-full">Fast</span>
                    </div>
                </div>

                <!-- Portfolio Item 2 -->
                <div class="glow-card glass rounded-xl p-6 border-2 border-indigo-500/30">
                    <h3 class="text-xl font-bold mb-2">Fashion Retail Platform</h3>
                    <p class="text-gray-400 mb-4">High-converting product showcase with cart, checkout, and payment integration.</p>
                    <div class="flex gap-2 flex-wrap">
                        <span class="text-xs bg-indigo-500/20 text-indigo-300 px-3 py-1 rounded-full">E-commerce</span>
                        <span class="text-xs bg-emerald-500/20 text-emerald-300 px-3 py-1 rounded-full">Payments</span>
                    </div>
                </div>

                <!-- Portfolio Item 3 -->
                <div class="glow-card glass rounded-xl p-6 border-2 border-indigo-500/30">
                    <h3 class="text-xl font-bold mb-2">Creative Professional Portfolio</h3>
                    <p class="text-gray-400 mb-4">Stunning portfolio showcasing work, projects, testimonials, and contact form.</p>
                    <div class="flex gap-2 flex-wrap">
                        <span class="text-xs bg-indigo-500/20 text-indigo-300 px-3 py-1 rounded-full">Portfolio</span>
                        <span class="text-xs bg-emerald-500/20 text-emerald-300 px-3 py-1 rounded-full">Modern</span>
                    </div>
                </div>

                <!-- Portfolio Item 4 -->
                <div class="glow-card glass rounded-xl p-6 border-2 border-indigo-500/30">
                    <h3 class="text-xl font-bold mb-2">Software Service Landing</h3>
                    <p class="text-gray-400 mb-4">High-converting SaaS landing page with pricing tiers, features, and free trial CTA.</p>
                    <div class="flex gap-2 flex-wrap">
                        <span class="text-xs bg-indigo-500/20 text-indigo-300 px-3 py-1 rounded-full">SaaS</span>
                        <span class="text-xs bg-emerald-500/20 text-emerald-300 px-3 py-1 rounded-full">Conversion</span>
                    </div>
                </div>

                <!-- Portfolio Item 5 -->
                <div class="glow-card glass rounded-xl p-6 border-2 border-indigo-500/30">
                    <h3 class="text-xl font-bold mb-2">Restaurant & Menu Showcase</h3>
                    <p class="text-gray-400 mb-4">Beautiful restaurant website with menu, reservations, gallery, and location info.</p>
                    <div class="flex gap-2 flex-wrap">
                        <span class="text-xs bg-indigo-500/20 text-indigo-300 px-3 py-1 rounded-full">Hospitality</span>
                        <span class="text-xs bg-emerald-500/20 text-emerald-300 px-3 py-1 rounded-full">Booking</span>
                    </div>
                </div>

                <!-- Portfolio Item 6 -->
                <div class="glow-card glass rounded-xl p-6 border-2 border-indigo-500/30">
                    <h3 class="text-xl font-bold mb-2">Online Learning Hub</h3>
                    <p class="text-gray-400 mb-4">Course catalog, instructor profiles, student dashboard, and progress tracking.</p>
                    <div class="flex gap-2 flex-wrap">
                        <span class="text-xs bg-indigo-500/20 text-indigo-300 px-3 py-1 rounded-full">Education</span>
                        <span class="text-xs bg-emerald-500/20 text-emerald-300 px-3 py-1 rounded-full">Interactive</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section id="faq" class="py-20 px-4 bg-gradient-to-b from-slate-900 to-slate-950">
        <div class="max-w-4xl mx-auto">
            <div class="text-center mb-16">
                <h2 class="text-4xl md:text-5xl font-bold mb-6">Frequently Asked Questions</h2>
                <p class="text-xl text-gray-400">
                    Everything you need to know about our services and pricing.
                </p>
            </div>

            <div class="space-y-4">
                <!-- FAQ Item 1 -->
                <div class="glass rounded-xl border-2 border-indigo-500/30">
                    <button class="accordion-btn w-full p-6 flex items-center justify-between hover:bg-slate-800/50 transition" data-accordion="0">
                        <span class="text-lg font-bold text-left">Why is the $100 tier hosted on GitHub Pages?</span>
                        <svg class="w-6 h-6 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
                        </svg>
                    </button>
                    <div class="accordion-content px-6 pb-6">
                        <p class="text-gray-400">
                            GitHub Pages is a bulletproof, enterprise-grade hosting platform maintained by Microsoft. It's faster than traditional shared hosting, completely secure with built-in SSL, and costs zero dollars per month. By eliminating bloated hosting providers, we pass those savings directly to you while maintaining professional-grade infrastructure.
                        </p>
                    </div>
                </div>

                <!-- FAQ Item 2 -->
                <div class="glass rounded-xl border-2 border-indigo-500/30">
                    <button class="accordion-btn w-full p-6 flex items-center justify-between hover:bg-slate-800/50 transition" data-accordion="1">
                        <span class="text-lg font-bold text-left">What's the difference between the $100 and $115 packages?</span>
                        <svg class="w-6 h-6 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
                        </svg>
                    </button>
                    <div class="accordion-content px-6 pb-6">
                        <p class="text-gray-400 mb-4">
                            The $100 Starter Package includes a fully functional website deployed on GitHub Pages with a gh-pages URL (yourname.github.io).
                        </p>
                        <p class="text-gray-400 mb-4">
                            The $115 Custom Domain Package includes everything in the Starter Package PLUS:
                        </p>
                        <ul class="space-y-2 text-gray-400 ml-4">
                            <li>• Custom domain setup (.com, .net, .org)</li>
                            <li>• Complete DNS configuration</li>
                            <li>• SSL/HTTPS on your custom domain</li>
                            <li>• Domain mapping and routing</li>
                        </ul>
                        <p class="text-gray-400 mt-4">
                            For $15 more, you get a professional branded domain instead of a GitHub URL.
                        </p>
                    </div>
                </div>

                <!-- FAQ Item 3 -->
                <div class="glass rounded-xl border-2 border-indigo-500/30">
                    <button class="accordion-btn w-full p-6 flex items-center justify-between hover:bg-slate-800/50 transition" data-accordion="2">
                        <span class="text-lg font-bold text-left">How long does a website take to build?</span>
                        <svg class="w-6 h-6 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
                        </svg>
                    </button>
                    <div class="accordion-content px-6 pb-6">
                        <p class="text-gray-400">
                            For the $100 and $115 packages, turnaround time is typically <strong>3-7 business days</strong> from project kickoff to live deployment. We gather your content, design the layout, and deploy directly to GitHub Pages.
                        </p>
                        <p class="text-gray-400 mt-4">
                            For $500+ complex projects, timeline depends on scope and feature complexity. We'll provide a detailed timeline estimate during the consultation phase.
                        </p>
                    </div>
                </div>

                <!-- FAQ Item 4 -->
                <div class="glass rounded-xl border-2 border-indigo-500/30">
                    <button class="accordion-btn w-full p-6 flex items-center justify-between hover:bg-slate-800/50 transition" data-accordion="3">
                        <span class="text-lg font-bold text-left">What determines the cost for $500+ complex projects?</span>
                        <svg class="w-6 h-6 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
                        </svg>
                    </button>
                    <div class="accordion-content px-6 pb-6">
                        <p class="text-gray-400 mb-4">
                            Custom project pricing is based on three main factors:
                        </p>
                        <ul class="space-y-2 text-gray-400 ml-4 mb-4">
                            <li><strong>1. Feature Complexity</strong> - Dynamic pages, databases, APIs, real-time updates</li>
                            <li><strong>2. Custom Development Hours</strong> - Complex logic, integrations, testing</li>
                            <li><strong>3. Deployment & Hosting</strong> - Custom servers, managed databases, scaling requirements</li>
                        </ul>
                        <p class="text-gray-400">
                            Use our calculator above to estimate costs for common add-ons, or contact us for a full custom quote.
                        </p>
                    </div>
                </div>

                <!-- FAQ Item 5 -->
                <div class="glass rounded-xl border-2 border-indigo-500/30">
                    <button class="accordion-btn w-full p-6 flex items-center justify-between hover:bg-slate-800/50 transition" data-accordion="4">
                        <span class="text-lg font-bold text-left">Are there any hidden monthly fees?</span>
                        <svg class="w-6 h-6 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
                        </svg>
                    </button>
                    <div class="accordion-content px-6 pb-6">
                        <p class="text-gray-400 mb-4">
                            <strong>Absolutely not.</strong> Our pricing is completely transparent and all-inclusive:
                        </p>
                        <ul class="space-y-2 text-gray-400 ml-4">
                            <li>✓ No monthly hosting fees</li>
                            <li>✓ No renewal fees</li>
                            <li>✓ No setup charges</li>
                            <li>✓ No surprise upgrades</li>
                            <li>✓ Your code is yours forever</li>
                        </ul>
                        <p class="text-gray-400 mt-4">
                            The only recurring expense might be your custom domain (if chosen), which you control and manage directly with your registrar.
                        </p>
                    </div>
                </div>

                <!-- FAQ Item 6 -->
                <div class="glass rounded-xl border-2 border-indigo-500/30">
                    <button class="accordion-btn w-full p-6 flex items-center justify-between hover:bg-slate-800/50 transition" data-accordion="5">
                        <span class="text-lg font-bold text-left">Can I get updates or modifications after launch?</span>
                        <svg class="w-6 h-6 transform transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
                        </svg>
                    </button>
                    <div class="accordion-content px-6 pb-6">
                        <p class="text-gray-400">
                            Yes! After your site launches, you'll own the complete source code on GitHub. You can make edits yourself or hire us for future updates. We offer affordable maintenance packages for ongoing changes, new features, and platform updates.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact & Inquiry Form -->
    <section id="contact" class="py-20 px-4 bg-gradient-to-b from-slate-950 to-slate-900">
        <div class="max-w-4xl mx-auto">
            <div class="text-center mb-16">
                <h2 class="text-4xl md:text-5xl font-bold mb-6">Get Started Today</h2>
                <p class="text-xl text-gray-400">
                    Fill out the form below and we'll be in touch within 24 hours.
                </p>
            </div>

            <div class="glass rounded-xl p-8 md:p-12 border-2 border-indigo-500/30">
                <form id="contact-form" class="space-y-6">
                    <!-- Name Field -->
                    <div>
                        <label class="block text-sm font-bold mb-3 text-gray-300">Full Name *</label>
                        <input type="text" name="name" placeholder="Your name" required class="w-full px-4 py-3 rounded-lg bg-slate-800/50 border border-indigo-500/20 text-white placeholder-gray-500 focus:outline-none focus:border-indigo-500/60 transition">
                    </div>

                    <!-- Email Field -->
                    <div>
                        <label class="block text-sm font-bold mb-3 text-gray-300">Email Address *</label>
                        <input type="email" name="email" placeholder="you@example.com" required class="w-full px-4 py-3 rounded-lg bg-slate-800/50 border border-indigo-500/20 text-white placeholder-gray-500 focus:outline-none focus:border-indigo-500/60 transition">
                    </div>

                    <!-- Package Selection -->
                    <div>
                        <label class="block text-sm font-bold mb-3 text-gray-300">Select Your Package *</label>
                        <select name="package" required class="w-full px-4 py-3 rounded-lg bg-slate-800/50 border border-indigo-500/20 text-white focus:outline-none focus:border-indigo-500/60 transition">
                            <option value="">Choose a package...</option>
                            <option value="Starter - $100">Starter Package - $100</option>
                            <option value="Custom Domain - $115">Custom Domain Package - $115</option>
                            <option value="Enterprise - $500+">Enterprise & Custom Apps - $500+</option>
                        </select>
                    </div>

                    <!-- Project Scope -->
                    <div>
                        <label class="block text-sm font-bold mb-3 text-gray-300">Project Scope & Details *</label>
                        <textarea name="scope" placeholder="Tell us about your project, goals, and any specific features or requirements..." required class="w-full px-4 py-3 rounded-lg bg-slate-800/50 border border-indigo-500/20 text-white placeholder-gray-500 focus:outline-none focus:border-indigo-500/60 transition resize-none" rows="6"></textarea>
                    </div>

                    <!-- Phone Field (Optional) -->
                    <div>
                        <label class="block text-sm font-bold mb-3 text-gray-300">Phone Number (Optional)</label>
                        <input type="tel" name="phone" placeholder="(555) 123-4567" class="w-full px-4 py-3 rounded-lg bg-slate-800/50 border border-indigo-500/20 text-white placeholder-gray-500 focus:outline-none focus:border-indigo-500/60 transition">
                    </div>

                    <!-- Consent Checkbox -->
                    <div class="flex items-start gap-3">
                        <input type="checkbox" id="consent" name="consent" required class="mt-1">
                        <label for="consent" class="text-sm text-gray-400">
                            I agree to be contacted about my project inquiry and understand that Teez2Print will respond within 24 hours.
                        </label>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="w-full btn-glow text-white font-bold py-4 rounded-lg transition-all text-lg">
                        Submit Inquiry
                    </button>

                    <!-- Form Message -->
                    <div id="form-message" class="hidden text-center py-4 rounded-lg"></div>
                </form>

                <p class="text-center text-gray-500 text-sm mt-8">
                    We respect your privacy. Your information is secure and will never be shared.
                </p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="border-t border-indigo-500/20 bg-slate-950/80 backdrop-blur-sm">
        <div class="max-w-6xl mx-auto px-4 py-16">
            <div class="grid md:grid-cols-4 gap-12 mb-12">
                <!-- Brand -->
                <div>
                    <div class="flex items-center gap-2 mb-4">
                        <div class="w-10 h-10 bg-gradient-to-br from-indigo-500 to-emerald-500 rounded-lg flex items-center justify-center font-bold text-white">
                            T2P
                        </div>
                        <span class="text-lg font-bold gradient-text">Teez2Print</span>
                    </div>
                    <p class="text-gray-400 text-sm">
                        Professional websites at unbeatable prices. Fast. Secure. Affordable.
                    </p>
                </div>

                <!-- Quick Links -->
                <div>
                    <h4 class="font-bold mb-4">Quick Links</h4>
                    <ul class="space-y-2">
                        <li><a href="#pricing" class="text-gray-400 hover:text-indigo-400 text-sm transition">Pricing</a></li>
                        <li><a href="#portfolio" class="text-gray-400 hover:text-indigo-400 text-sm transition">Portfolio</a></li>
                        <li><a href="#faq" class="text-gray-400 hover:text-indigo-400 text-sm transition">FAQ</a></li>
                        <li><a href="#contact" class="text-gray-400 hover:text-indigo-400 text-sm transition">Contact</a></li>
                    </ul>
                </div>

                <!-- Services -->
                <div>
                    <h4 class="font-bold mb-4">Services</h4>
                    <ul class="space-y-2">
                        <li><a href="#" class="text-gray-400 hover:text-indigo-400 text-sm transition">Web Design</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-indigo-400 text-sm transition">Development</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-indigo-400 text-sm transition">Custom Apps</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-indigo-400 text-sm transition">Maintenance</a></li>
                    </ul>
                </div>

                <!-- Contact Info -->
                <div>
                    <h4 class="font-bold mb-4">Contact</h4>
                    <ul class="space-y-2 text-sm">
                        <li class="text-gray-400">Email: <a href="mailto:teez2print@gmail.com" class="text-indigo-400 hover:text-indigo-300">teez2print@gmail.com</a></li>
                        <li class="text-gray-400">Available 24/7 for inquiries</li>
                        <li class="text-gray-400 mt-4 text-xs">Response time: Within 24 hours</li>
                    </ul>
                </div>
            </div>

            <!-- Divider -->
            <div class="border-t border-indigo-500/10 pt-8">
                <!-- Bottom Footer -->
                <div class="flex flex-col md:flex-row justify-between items-center gap-4">
                    <p class="text-gray-500 text-sm">
                        © 2024 Teez2Print Web Solutions. All rights reserved. | Deployed on GitHub Pages
                    </p>
                    <div class="flex gap-6">
                        <a href="#" class="text-gray-400 hover:text-indigo-400 transition">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24"><path d="M8.29 20v-7.21H5.413v-2.622h2.877V7.487c0-2.889 1.775-4.444 4.272-4.444 1.213 0 2.253.091 2.556.131v2.967h-1.756c-1.376 0-1.644.655-1.644 1.614v2.113h3.287l-4.282 2.622V20h-3.813z"/></svg>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-indigo-400 transition">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24"><path d="M23 3a10.9 10.9 0 01-3.14 1.53 4.48 4.48 0 00-7.86 3v1A10.66 10.66 0 013 4s-4 9 5 13a11.64 11.64 0 01-7 2s9 5 20 5a9.5 9.5 0 00-9-5.5c4.75 2.25 7-7 7-7a4.5 4.5 0 00-8-3v-1z"/></svg>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-indigo-400 transition">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24"><path d="M16 8a6 6 0 016 6v7h-4v-7a2 2 0 00-2-2 2 2 0 00-2 2v7h-4v-7a6 6 0 016-6zM2 9h4v12H2z"/></svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Floating CTA Button -->
    <button onclick="document.getElementById('contact-form').scrollIntoView({ behavior: 'smooth' })" class="floating-cta btn-glow w-16 h-16 rounded-full flex items-center justify-center text-white font-bold text-2xl transition-all hover:scale-110 hidden md:flex" aria-label="Get started">
        +
    </button>

    <!-- JavaScript -->
    <script>
        // Mobile Menu Toggle
        const mobileMenuBtn = document.getElementById('mobile-menu-btn');
        const mobileMenu = document.getElementById('mobile-menu');

        mobileMenuBtn.addEventListener('click', () => {
            mobileMenu.classList.toggle('active');
        });

        // Close mobile menu when link is clicked
        document.querySelectorAll('#mobile-menu a').forEach(link => {
            link.addEventListener('click', () => {
                mobileMenu.classList.remove('active');
            });
        });

        // FAQ Accordion
        document.querySelectorAll('.accordion-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const accordionId = this.dataset.accordion;
                const content = this.nextElementSibling;
                const icon = this.querySelector('svg');

                // Close other accordions
                document.querySelectorAll('.accordion-content').forEach((acc, index) => {
                    if (index != accordionId) {
                        acc.classList.remove('active');
                        document.querySelectorAll('.accordion-btn')[index].querySelector('svg').classList.remove('rotate-180');
                    }
                });

                // Toggle current accordion
                content.classList.toggle('active');
                icon.classList.toggle('rotate-180');
            });
        });

        // Price Calculator
        document.querySelectorAll('.feature-checkbox').forEach(checkbox => {
            checkbox.addEventListener('change', updatePrice);
        });

        function updatePrice() {
            let basePrice = 500;
            let totalPrice = basePrice;

            document.querySelectorAll('.feature-checkbox:checked').forEach(checkbox => {
                totalPrice += parseInt(checkbox.dataset.price);
            });

            document.getElementById('calc-price').textContent = totalPrice.toLocaleString();
        }

        // Form Submission
        document.getElementById('contact-form').addEventListener('submit', function(e) {
            e.preventDefault();

            const formData = {
                name: this.querySelector('[name="name"]').value,
                email: this.querySelector('[name="email"]').value,
                package: this.querySelector('[name="package"]').value,
                scope: this.querySelector('[name="scope"]').value,
                phone: this.querySelector('[name="phone"]').value || 'Not provided'
            };

            // Log form data (in production, send to backend)
            console.log('Form Submission:', formData);

            // Show success message
            const messageDiv = document.getElementById('form-message');
            messageDiv.textContent = '✓ Thank you! We\'ll be in touch within 24 hours.';
            messageDiv.className = 'block text-center py-4 rounded-lg bg-emerald-500/20 border border-emerald-500/50 text-emerald-300';

            // Reset form
            this.reset();

            // Hide message after 5 seconds
            setTimeout(() => {
                messageDiv.classList.add('hidden');
            }, 5000);
        });

        // Smooth Scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Show floating CTA button on scroll
        window.addEventListener('scroll', () => {
            const floatingCta = document.querySelector('.floating-cta');
            const contactSection = document.getElementById('contact');
            const contactRect = contactSection.getBoundingClientRect();

            if (contactRect.top > 500) {
                floatingCta.classList.remove('hidden');
            } else {
                floatingCta.classList.add('hidden');
            }
        });

        // Add fade-in animation on page load
        window.addEventListener('load', () => {
            document.querySelectorAll('.fade-in').forEach((el, index) => {
                el.style.animationDelay = `${index * 0.1}s`;
            });
        });

        // Prevent input placeholder flashing on mobile
        if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
            document.querySelectorAll('input, textarea, select').forEach(el => {
                el.addEventListener('focus', function() {
                    this.blur();
                    this.focus();
                });
            });
        }
    </script>
</body>
</html>
