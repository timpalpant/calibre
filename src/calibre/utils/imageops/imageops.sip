//Define the SIP wrapper to the imageops code
//Author - Kovid Goyal <kovid@kovidgoyal.net>

%Module(name=imageops, version=1)

%Import QtCore/QtCoremod.sip
%Import QtGui/QtGuimod.sip
%ModuleCode
#include <imageops.h>
#define IMAGEOPS_PREFIX \
            if (a0->isNull()) { PyErr_SetString(PyExc_ValueError, "Cannot operate on null QImage"); return NULL; } \
            try {
#define IMAGEOPS_SUFFIX \
        } catch (std::out_of_range &exc) { PyErr_SetString(PyExc_ValueError, exc.what()); return NULL; \
        } catch (std::bad_alloc &) { PyErr_NoMemory(); return NULL; \
        } catch (std::exception &exc) { PyErr_SetString(PyExc_Exception, exc.what()); return NULL; \
        } catch (...) { PyErr_SetString(PyExc_RuntimeError, "unknown error"); return NULL;} 
%End

QImage* remove_borders(const QImage &image, double fuzz);
%MethodCode
        IMAGEOPS_PREFIX
			sipRes = new QImage(remove_borders(*a0, a1));
        IMAGEOPS_SUFFIX
%End

QImage* grayscale(const QImage &image);
%MethodCode
        IMAGEOPS_PREFIX
			sipRes = new QImage(grayscale(*a0));
        IMAGEOPS_SUFFIX
%End

QImage gaussian_sharpen(const QImage &img, const float radius, const float sigma, const bool high_quality=true);
%MethodCode
        IMAGEOPS_PREFIX
			sipRes = new QImage(gaussian_sharpen(*a0, a1, a2, a3));
        IMAGEOPS_SUFFIX
%End

QImage gaussian_blur(const QImage &img, const float radius, const float sigma);
%MethodCode
        IMAGEOPS_PREFIX
			sipRes = new QImage(gaussian_blur(*a0, a1, a2));
        IMAGEOPS_SUFFIX
%End

QImage despeckle(const QImage &image);
%MethodCode
        IMAGEOPS_PREFIX
			sipRes = new QImage(despeckle(*a0));
        IMAGEOPS_SUFFIX
%End

void overlay(const QImage &image, QImage &canvas, unsigned int left, unsigned int top);
%MethodCode
        IMAGEOPS_PREFIX
            overlay(*a0, *a1, a2, a3);
        IMAGEOPS_SUFFIX
%End

QImage normalize(const QImage &image);
%MethodCode
        IMAGEOPS_PREFIX
			sipRes = new QImage(normalize(*a0));
        IMAGEOPS_SUFFIX
%End

QImage oil_paint(const QImage &image, const float radius=-1, const bool high_quality=true);
%MethodCode
        IMAGEOPS_PREFIX
			sipRes = new QImage(oil_paint(*a0, a1, a2));
        IMAGEOPS_SUFFIX
%End
QImage quantize(const QImage &image, unsigned int maximum_colors=256, bool dither=true);
%MethodCode
        IMAGEOPS_PREFIX
			sipRes = new QImage(quantize(*a0, a1, a2));
        IMAGEOPS_SUFFIX
%End
