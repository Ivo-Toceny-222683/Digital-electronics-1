# Ivo Točený, 222683 - 08-traffic_lights

## 0. part - Link to GitHub repository

[My GitHub 08-traffic_lights repository](https://github.com/Ivo-Toceny-222683/Digital-electronics-1/tree/main/Labs/08-traffic_lights)

## 1. part - Preparation tasks

### State table:

| **Input P** | `0` | `0` | `1` | `1` | `0` | `1` | `0` | `1` | `1` | `1` | `1` | `0` | `0` | `1` | `1` | `1` |
| :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Clock** | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) | ![rising](images/arrow.webp) |
| **State** | A | A | B | C | C | D | A | B | C | D | B | B | B | C | D | B |
| **Output R** | `0` | `0` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `0` | `1` | `0` |

### Figure with connection of RGB LEDs on Nexys A7 board and completed table with color settings

