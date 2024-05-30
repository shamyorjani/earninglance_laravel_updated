import { defineConfig } from "vite";
import laravel from "laravel-vite-plugin";
import { resolve } from "path";
import { viteStaticCopy } from "vite-plugin-static-copy";

export default defineConfig({
    plugins: [
        laravel({
            input: ["resources/css/app.css", "resources/js/app.js"],
            refresh: true,
        }),
        viteStaticCopy({
            targets: [
                {
                    src: "public/assets/images/*",
                    dest: "assets/images",
                },
                {
                    src: "public/assets/fonts/*",
                    dest: "assets/fonts",
                },
            ],
        }),
    ],
    resolve: {
        alias: {
            "@": resolve(__dirname, "resources/js"),
        },
    },
    build: {
        rollupOptions: {
            output: {
                assetFileNames: (assetInfo) => {
                    let extType = assetInfo.name.split(".").at(1);
                    if (/css|js/.test(extType)) {
                        return `assets/${extType}/[name].[hash].[ext]`;
                    }
                    if (/png|jpe?g|svg|gif|tiff|bmp|ico|webp/.test(extType)) {
                        return `assets/images/[name].[hash].[ext]`;
                    }
                    if (/woff2?|eot|ttf|otf/.test(extType)) {
                        return `assets/fonts/[name].[hash].[ext]`;
                    }
                    return `assets/[ext]/[name].[hash].[ext]`;
                },
            },
        },
    },
});
