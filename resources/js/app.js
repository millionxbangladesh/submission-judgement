import 'bootstrap';
import '../css/style.scss';
import {createApp, h} from 'vue';
import {createInertiaApp, Head, Link} from '@inertiajs/vue3';
import {resolvePageComponent} from 'laravel-vite-plugin/inertia-helpers';
import {ZiggyVue} from '../../vendor/tightenco/ziggy';
import AOS from 'aos'


createInertiaApp({
    title: (title) => `${title} - Millionx Bangladesh`,
    resolve: (name) => resolvePageComponent(`./Pages/${name}.vue`, import.meta.glob('./Pages/**/*.vue')),
    setup({el, App, props, plugin}) {
        return createApp({render: () => h(App, props)})
            .use(plugin)
            .use(ZiggyVue)
            .use(AOS.init())
            .component("Head", Head)
            .component("Link", Link)
            .mount(el);
    },
    progress: {
        color: '#A321B9',
        showSpinner: true
    },
});

