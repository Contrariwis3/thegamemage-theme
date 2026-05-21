// ABOUTME: Webpack build for the theme's frontend assets.
// ABOUTME: Compiles SCSS + bundles fonts into static/ for Hugo to serve.

const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CssMinimizerPlugin = require('css-minimizer-webpack-plugin');

module.exports = {
    entry: './frontend/index.js',
    output: {
        //path: path.resolve(__dirname, 'frontend/build'),
        path: path.resolve(__dirname, 'static'),
        filename: 'bundle.js',
        clean: true, // Cleans the output directory before build
    },
    module: {
        rules: [
            // Process CSS files
            {
                test: /\.css$/,
                use: [
                    MiniCssExtractPlugin.loader,
                    'css-loader'
                ]
            },
            // Process SCSS files
            {
                test: /\.scss$/,
                use: [
                    MiniCssExtractPlugin.loader,
                    'css-loader',
                    'sass-loader'
                ]
            },
            // Handle fonts and images
            {
                test: /\.(woff|woff2|eot|ttf|otf|svg|png|jpg|gif)$/i,
                type: 'asset/resource',
                generator: {
                    filename: 'assets/[name][ext]'
                }
            }
        ]
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: 'styles.css',
        })
    ],
    performance: {
        hints: false, // Disables all performance hints
    },
    optimization: {
        minimizer: [
            new CssMinimizerPlugin(),
            // If you're also minifying JS, you'd need to add TerserPlugin here too
        ],
    }
};
