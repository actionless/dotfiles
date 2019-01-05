PT_TO_PX_RATIO = (1 + 1/3)


def apply_dpi(val, dpi):
    return val * (dpi / 96)


def get_virtual_px_from_dpi_size(val, dpi):
    return val / (dpi / 96)


def from_pt_to_px_96(pt):
    px = pt * PT_TO_PX_RATIO
    return px


def from_pt_to_px_dpi(pt, dpi):
    vpx = from_pt_to_px_96(pt)
    px = apply_dpi(vpx, dpi)
    return px


def from_px_to_pt_96(px):
    pt = px / PT_TO_PX_RATIO
    return pt


def from_px_to_pt_dpi(px, dpi):
    vpx = get_virtual_px_from_dpi_size(px, dpi)
    pt = from_px_to_pt_96(vpx)
    return pt


if __name__ == "__main__":
    import sys
    print(
        # from_pt_to_px_96(
        # from_pt_to_px_dpi(
        # from_px_to_pt_96(
        from_px_to_pt_dpi(
        # apply_dpi(
            float(sys.argv[1]),
            float(sys.argv[2])
        )
    )
